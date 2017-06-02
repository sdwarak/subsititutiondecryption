# Following assumptions are used to reduce the search space
# This is used to generate the histogram of files
#
#
#

file_paths = %w(plain encrypted encrypted_hard)

WORDS_COUNT = {}

DICTIONARY = []

def sanitize_word(word)
  word.downcase.gsub(/[\d.,()\[\]!;:?\s"]/,'')
end

def generate_a_word_hash_from_file(file)
  word_hash = {}
  file.each_line do |line|
    words = line.split
    words.each do |word|
      word = sanitize_word(word)
      if word_hash[word]
        word_hash[word] += 1
      else
        word_hash[word] = 1
      end
    end
  end
  word_hash
end

def generate_a_word_array_from_file(file)
  word_array = []
  file.each_line do |line|
    words = line.split
    words.each do |word|
      word = sanitize_word(word)
      word_array << word unless word_array.include?(word)
    end
  end
  word_array
end


def read_and_store_file(file_name)
  File.open("#{file_name}.txt", "r")
end

file_paths.each do |file_name|
  file = read_and_store_file(file_name)

  text_histogram = generate_a_word_hash_from_file(file)

  file.close

  puts "#{file_name} histogram: \n"

  text_histogram.sort {|a,b| a[1] <=> b[1]}.each do |key,value|
    puts "#{key} => #{value}"
  end

  puts "End of #{file_name} histogram. \n\n"
end

puts "The end. "
