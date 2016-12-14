module Subconvtr

  class Monitor

    def initialize
    end
    # Converts the target file from windows-1254 to utf-8 encoding.
    def run

      output = `ls | grep -E ".srt"`.split("\n")

      # puts output
      output.each do |current|
        if !(`file -I "#{current}"`.include? "charset=utf-8")
          puts `file -I "#{current}"`
          `iconv -f windows-1254 -t utf-8 "#{current}" > temp24124eqqweqwrfsdf.srt && mv temp24124eqqweqwrfsdf.srt "#{current}"`
          puts `file -I "#{current}"`
        else
          # print '.'
        end
      end

      sleep 1
    end

    def self.start
      loop do
        self.new.run
      end
    end
  end
end

# trapping the ctrl+c exit
trap "SIGINT" do
  puts ""
  puts "Exiting"
  puts "......."
  puts "See you next time 🐰"
  puts ""
  exit 130
end

puts `pwd`
puts 'Folder above is being watched 🤓'
puts 'Observing for .srt files, i.e. ones having windows-1254 charset will be converted into utf-8'
puts 'Files will be analyzed before conversion 🚀'
puts ''
puts 'Press Ctrl+C to exit'

Subconvtr::Monitor.start

