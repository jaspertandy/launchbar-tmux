class Session
	attr_reader :tmuxinator, :running, :final

	def initialize
		tmpdir = `cd /var/folders/*/*/*/tmux-501; pwd`.strip.split "/"
		tmpdir.pop
		tmpdir = tmpdir.join "/"
		@running = `export TMPDIR=#{tmpdir}; tmux list-sessions | awk -F: '{print $1}'`.split "\n"
		@tmuxinator = `sudo -u JT /bin/ls -l ~/.tmuxinator/ | awk '{print $NF}' | sed 's/\.yml$//'`.split "\n"

		@final = {}
		@running.each do |session|
			next if @tmuxinator.include? session
			@final[session] = "tmux attach -d -t #{session}"
		end
		@tmuxinator.each do |session|
			@final[session] = "mux s #{session}"
		end
	end

	def filter(str)
		new_final = {}
		@final.each do |key , command|
			next if !key.include? str
			new_final[key] = command
		end
		@final = new_final
	end
end
