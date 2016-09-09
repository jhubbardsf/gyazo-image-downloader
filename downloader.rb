#!/usr/bin/env ruby

require 'gyazo'
require 'date'
require 'open-uri'
require 'yaml'
require 'fileutils'

class DateTime
	def to_local_time
		to_time(new_offset(DateTime.now.offset-offset), :local)
	end

	private
	def to_time(dest, method)
		#Convert a fraction of a day to a number of microseconds
		usec = (dest.sec_fraction * 60 * 60 * 24 * (10**6)).to_i
		Time.send(method, dest.year, dest.month, dest.day, dest.hour, dest.min,
							dest.sec, usec)
	end
end

config = YAML.load_file('config.yml')
FileUtils.mkdir_p 'pictures'

puts 'Connecting to Gyazo','----'
gyazo = Gyazo::Client.new config['access_key']

puts "Total # Of Pictures: #{gyazo.list.count}"
gyazo.list.each_with_index do |image, index|
	time = DateTime.strptime(image['created_at'], '%FT%T%:z').to_local_time.strftime('%F@%H-%M-%S')
	url = image['url']
	extension = url.split('.').last
	file_name = "#{time}.#{extension}"

	puts "#{index + 1}: Downloading #{url} as #{file_name}"
	open(url) {|f|
		File.open("pictures/#{file_name}",'wb') do |file|
			file.puts f.read
		end
	}
end
puts 'Downloading complete'

