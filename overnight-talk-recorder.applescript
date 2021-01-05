set meetingURL to ""
set startDelay to ""
set recordingDuration to ""

set meetingURL to text returned of (display dialog "Provide your Meeting URL" buttons {"Proceed"} default button "Proceed" default answer "" with icon 1)

if meetingURL is "" then
	display dialog "Meeting URL is required.  Please try again." buttons {"Ok"} default button "Ok"
	error number -128
end if

set startDelay to text returned of (display dialog "Provide a delay before an attempt to join the meeting is made (in seconds)." buttons {"Proceed"} default button "Proceed" default answer "0" with icon 1 giving up after 15)

if startDelay is "" then
	set startDelay to 0
end if

set recordingDuration to text returned of (display dialog "Provide the expected length of the meeting (in seconds)." buttons {"Proceed"} default button "Proceed" default answer "7200" with icon 1 giving up after 15)

if recordingDuration is "" then
	set recordingDuration to 7200
end if

set SafariCloseChoice to display dialog "All Safari windows need to be closed to continue." with icon stop buttons {"Close All Safari Windows", "Cancel"} default button "Cancel" giving up after 5

if SafariCloseChoice is "Cancel" then
	error number -128
else
	delay startDelay
	try
		tell application "Safari"
			set url_list to URL of every document
		end tell
	on error
		display dialog "Unable to save your existing pages." buttons {"Quit"} default button "Quit" giving up after 5
		error number -128
	end try
	try
		tell application "Safari"
			close every window
		end tell
	on error
		display dialog "Unable to close all of the open Safari windows.  No attempt was made to join the meeting."
	end try
end if

try
	open location meetingURL
	delay 1
on error
	display dialog "Unable to open Meeting URL.  Please check that it is valid and try again.  No attempt was made to join the meeting."
end try

try
	tell application "System Events"
		tell process "Safari"
			click button "Allow" of group 1 of tab group 1 of splitter group 1 of window "Launch Meeting - Zoom"
			-- Record
			
			tell application "QuickTime Player" to new screen recording
			
			tell application "System Events" to tell process "Screen Shot"
				repeat until exists button "Record" of its front window
					delay 0.1
				end repeat
				click button "Record" of its front window
			end tell
			
			delay recordingDuration
			
			tell application "System Events" to ¬
				click menu bar item 1 ¬
					of menu bar 1 ¬
					of application process "screencaptureui"
			
			
			try
				tell application "System Events"
					set leaveMeetingFailureMsg to ""
					set theID to (unix id of processes whose name is "zoom.us")
					try
						do shell script "kill -9 " & theID
					end try
				end tell
			on error
				set leaveMeetingFailureMsg to "Sorry, unable to quit Zoom. You lingered at the meeting until the host ended it."
			end try
			
			tell application "Safari"
				repeat with the_url in url_list
					open location the_url
				end repeat
			end tell
			
		end tell
	end tell
on error
	tell application "Safari"
		repeat with the_url in url_list
			open location the_url
		end repeat
	end tell
	display dialog "Unable to launch the meeting via Safari once all windows had closed.  No further attempt was made to join the meeting." buttons {"Quit"} default button "Quit"
	
end try

if leaveMeetingFailureMsg is not "" then
	display dialog leaveMeetingFailureMsg buttons {"Ok"} default button "Ok"
end if
