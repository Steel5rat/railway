require 'active_record'
require './lib/stations_lines'
require './lib/station'
require './lib/line'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuation = database_configurations["development"]
ActiveRecord::Base.establish_connection(development_configuation)

puts "hello!"

def menu
  choice = nil
  until choice == 'e'
    puts "Press 'a' to add station, 'al' to add line, 'ls' to  list stations, 'll' to list lines, 'ar' to add relation"
    puts "Press 'e' to exit."
    choice = gets.chomp
    case choice
      when 'a'
        addStation
      when 'al'
        addLine
      when 'ls'
        listStations
      when 'll'
        listLines
      when 'ar'
        addRelate
      else
    end
  end
end

def listStations
  Station.all.each do |station|
    puts station
  end
end

def listLines
  Line.all.each do |line|
    puts line
  end
end

def addStation
  name = prompt 'Enter name of station'
  station = Station.new(:name => name)
  if station.save
    puts 'saved'
  else
    puts 'wrong smth'
  end
end

def addLine
  name  = prompt 'Enter name of line'
  line = Line.new(:name => name)
  if line.save
    puts 'saved'
  else
    puts 'bad. very bad'
  end
end

def addRelate
   listStations
   nameStation = prompt 'Enter station'
   listLines
   nameList = prompt 'Enter line'
   relate = Stations_lines.new(:station_id =>nameStation, :line_id => nameList)
   Stations_lines.all.each do |rel|
     puts rel
   end
end

def prompt text
  puts text
  gets.chomp
end

menu
