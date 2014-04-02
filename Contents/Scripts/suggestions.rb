require 'json'
require_relative './session'

sessions = Session.new
sessions.filter ARGV[0] if ARGV[0] != ''

output = []
sessions.final.each do |title,running|
	push = {}
	push['title'] = title
	push['subtitle'] = running
	output.push push
end

puts output.to_json
