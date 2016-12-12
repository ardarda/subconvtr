module Subconvtr
	class Monitor

		# Converts the target file from windows-1254 to utf-8 encoding.
	  def run
	    # puts "merhaba #{target_file_name}!"
			#file = #{target_file_name}	\
			# nice = `iconv -f windows-1254 -t utf-8 "#{target_file_name}" > temp24124eqqweqwrfsdf.srt && mv temp24124eqqweqwrfsdf.srt "#{target_file_name}" && rm temp24124eqqweqwrfsdf.srt`
			# puts 'OUTPUT: ' + output

	    output = `ls | grep -E ".srt"`.split("\n")
	    # puts output
	    output.each do |current|

				if !(`file -I "#{current}"`.include? "charset=utf-8")
					puts `file -I "#{current}"`
		    	`iconv -f windows-1254 -t utf-8 "#{current}" > temp24124eqqweqwrfsdf.srt && mv temp24124eqqweqwrfsdf.srt "#{current}"`
		    	puts `file -I "#{current}"`
		    else
		    	print '.'
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
Subconvtr::Monitor.start