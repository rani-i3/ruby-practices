require 'date'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby calendar.rb [options]"

  opts.on("-m", "--month MONTH", Integer, "Specify the month (1-12)") do |month|
    options[:month] = month
  end

  opts.on("-y", "--year YEAR", Integer, "Specify the year") do |year|
    options[:year] = year
  end
end.parse!

current_date = Date.today
year = options[:year] || current_date.year
month = options[:month] || current_date.month

date_range = Date.new(year, month, 1)..Date.new(year, month, -1)

puts current_date.strftime("%-m月 %Y").center(20)
puts "日 月 火 水 木 金 土"

initial_offset = date_range.first.wday

print "   " * initial_offset

date_range.each do |date|
  print date.day.to_s.rjust(2) + " "

  puts if date.wday == 6
end
