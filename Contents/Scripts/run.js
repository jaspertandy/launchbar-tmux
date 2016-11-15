include("helper.js");

function run(input) {
	var mux,
		script;

	mux = tmuxinator().find(function(value){
		return value == input;
	});

	if (mux) {
		mux = "mux s " + mux;
	}

	script = 'tell application "iTerm" \n' +
'  tell current window \n' +
'    create tab with default profile \n' +
'    tell current tab \n' +
'      repeat with aSession in sessions \n' +
'        tell aSession \n' +
'          write text "' + mux + '" \n' +
'        end tell \n' +
'      end repeat \n' +
'    end tell \n' +
'  end tell \n' +
'end tell';

	LaunchBar.executeAppleScript(script);
}
