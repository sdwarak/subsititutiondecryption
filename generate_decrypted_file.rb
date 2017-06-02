CIPHER = {
    'a'	=> 'z',
    'b'	=> 'y',
    'c' => 'x',
    'd'	=> 'w',
    'e'	=> 'f',
    'f'	=> 'v',
    'g'	=> 'u',
    'h'	=> 'b',
    'i'	=> 'c',
    'j' => 't',
    'k' => 's',
    'l' => 'r',
    'm' => 'd',
    'n' => 'e',
    'o' => 'q',
    'p' => 'p',
    'q' => 'o',
    'r' => 'n',
    's' => 'm',
    't' => 'l',
    'u' => 'k',
    'v' => 'j',
    'w' => 'i',
    'x' => 'h',
    'y' => 'g',
    'z' => 'a',
    'A'	=> 'Z',
    'B'	=> 'Y',
    'C' => 'X',
    'D'	=> 'W',
    'E'	=> 'F',
    'F'	=> 'V',
    'G'	=> 'U',
    'H'	=> 'B',
    'I'	=> 'C',
    'J' => 'T',
    'K' => 'S',
    'L' => 'R',
    'M' => 'D',
    'N' => 'E',
    'O' => 'Q',
    'P' => 'P',
    'Q' => 'O',
    'R' => 'N',
    'S' => 'M',
    'T' => 'L',
    'U' => 'K',
    'V' => 'J',
    'W' => 'I',
    'X' => 'H',
    'Y' => 'G',
    'Z' => 'A'
}

CIPHER_HARD = {
    'a'	=> 't',
    'b'	=> 'a',
    'c' => 'k',
    'd'	=> 's',
    'e'	=> 'z',
    'f'	=> 'y',
    'g'	=> 'w',
    'h'	=> 'l',
    'i'	=> 'q',
    'j' => 'j',
    'k' => 'b',
    'l' => 'r',
    'm' => 'm',
    'n' => 'v',
    'o' => 'g',
    'p' => 'o',
    'q' => 'c',
    'r' => 'd',
    's' => 'u',
    't' => 'i',
    'u' => 'n',
    'v' => 'p',
    'w' => 'f',
    'x' => 'x',
    'y' => 'h',
    'z' => 'e',
    'A'	=> 'T',
    'B'	=> 'A',
    'C' => 'K',
    'D'	=> 'S',
    'E'	=> 'Z',
    'F'	=> 'Y',
    'G'	=> 'W',
    'H'	=> 'L',
    'I'	=> 'Q',
    'J' => 'J',
    'K' => 'B',
    'L' => 'R',
    'M' => 'M',
    'N' => 'V',
    'O' => 'G',
    'P' => 'O',
    'Q' => 'C',
    'R' => 'D',
    'S' => 'U',
    'T' => 'I',
    'U' => 'N',
    'V' => 'P',
    'W' => 'F',
    'X' => 'X',
    'Y' => 'H',
    'Z' => 'E'
}

CONTENT = ''



file_path = 'encrypted_hard.txt'

def decrypt_file(file_name)
  tfile = File.open("#{file_name}.txt", 'r+') do |file|
    file.each_line do |line|
      cipher_hash = if file_name == 'encrypted'
                      CIPHER
                    else
                      CIPHER_HARD
                    end
      line.each_char do |letter|
        if cipher_hash[letter].nil?
          CONTENT << letter
        else
          CONTENT << cipher_hash[letter]
        end
      end
    end
  end
  tfile.close
end

file_names = %w(encrypted encrypted_hard)
file_names.each do |file_name|
  decrypt_file(file_name)
  File.write("decrypted_#{file_name}.txt", CONTENT)
  CONTENT = ''
end
