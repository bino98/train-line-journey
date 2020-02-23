require './journey.rb'

destiny_text = EkiSampler.new.destiny

File.open("destiny_list.md", "a") do |f|
  f.puts("- #{destiny_text}")
end
