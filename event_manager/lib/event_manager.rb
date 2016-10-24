require "csv"


def clean_zipcode(zipcode)
 zipcode.to_s.rjust(5,"0")[0..4]
end
# puts "EventManager Initialized!"

#File - ARGV[0]
csv_file = 
	if ARGV.size == 1
		ARGV[0]
	else
		File.expand_path(File.dirname(__FILE__))+"/../samples/event_attendees.csv"
	end

contents = CSV.open csv_file, headers: true, header_converters: :symbol
contents.each do |row|
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])

	puts "#{name} #{zipcode}"
end