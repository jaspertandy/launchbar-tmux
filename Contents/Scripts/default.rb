require_relative './session.rb'

sessions = Session.new
session = ARGV[0]

command = sessions.final[session] == nil ? "tmux new -s #{session}" : sessions.final[session]

script = "tell application \"iTerm\"
	activate current terminal
	tell the current terminal
		set newSession to (launch session \"Default Session\")
		tell newSession to write text \"#{command}\"
	end tell
end tell".split "\n"

`osascript -e '#{script.join "' -e '"}'`
