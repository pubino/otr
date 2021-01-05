# Overnight Talk Recorder

Attend and record talks while you sleep.

## Limitations

* Only supports Zoom URLs for meetings and webinars.
* Only records internal microphone, not system audio.
* Requires manually preconfiguring screen recording defaults.
* Requires preventing machine from sleeping via Energy Saver.
* Requires Security & Privacy exemptions for Accessibility.
* Requires temporarily closing all open Safari pages and tabs.
* Written in 1993 AppleScript.

## Features

* Joins a meeting or webinar via provided or hardcoded URL, initiating and subsequently terminating a video screen capture.
* Delays the join and record process by a provided or hardcoded value, allowing the process to run at some future time (in seconds, defaults to 0).
* Leaves the meeting and ends the recording after a provided or hardcoded value (in seconds, defaults to 7200).
* Restores closed Safari pages and tabs automatically.

## Installation

Overnight Talk Recorder (OTR) is an automation script written in [AppleScript](https://en.wikipedia.org/wiki/AppleScript) for Macintosh computers running macOS Big Sur 11.1 and higher.

### Prerequisites

1. Allow the Script Editor app permission to automate the computer.  Open the Security & Privacy preference pane of System Preferences, find the Accessibility section under the Privacy tab, and click the + button, proceeding to add the Script Edtior app to the list labeled "Allow the apps below to control your computer".  The Script Edtior app can be found in the Applications/Utilities folder inside of Finder.  If you skip this step, the first run of the script will fail with a permissions error.

2. Change your screen recording defaults.  Press Command+Shift+5 to proceed as if you are going to capture an image of the screen.  When the capture toolbar appears, click on the button labeled "Record Entire Screen".  Under the Options menu, click Built-in Microphone.  You can close the toolbar once this is done.  If you skip this step, the recording will fail to start.

3. Optionally change when your computer goes to sleep, preferrably on battery power.  If your organization or institution has a policy enforcing sleep or other timeouts, consider [utilizing an app explicitly designed to keep your Mac awake](https://apps.apple.com/us/app/amphetamine/id937984704?mt=12).  If you skip this step, the recording may fail to begin on time.

3. Download the file or copy the text of the script and open it in the Script Editor app found inside the Applications/Utilities folder.

### Usage

1. Click the Play button to Run the Script, or click Run under the Script menu inside of the Script Editor app.
2. 

#### Advanced Usage

## Future Plans

* Add support for links other than Zoom.
* Eliminate screen recording preconfiguration requirement.
* Eliminate Energy Saver modification requirement.
* Create a similar workflow on Windows and Linux platforms, rexamine feasability on iOS.
* Disavowing this code.
