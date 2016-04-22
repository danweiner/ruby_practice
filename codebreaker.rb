# A program that will encrypt and decrypt another document using the Caeser cipher

class Caesar
  # code will go here
  def initialize(shift)
    alphabet_lower = ('a'..'z').to_a.join
    alphabet_upper = alphabet_lower.upcase
    numbers = (0..9).to_a.join
    alphabet = alphabet_lower + alphabet_upper + numbers
    # make sure the shift number will always be less than the array length
    index = shift % alphabet.size
    # build the encrypted version by grabbing parts of the alphabet and swapping them using Ruby string methods
    # provide an index to a string and u get the character at that position
    # if you provide a range of indexes, you get a substring
    # here you're building a new string starting from index going to end of alphabet, then looping back to beginning of alphabet
    encrypted_alphabet = alphabet[index..-1] + alphabet[0...index]
    setup_lookup_tables(alphabet, encrypted_alphabet)
  end

  def setup_lookup_tables(decrypted_alphabet, encrypted_alphabet)
    # loop through the length of the alphabet and for each letter fill in one of the two lookup tables
    @encryption_hash = {}
    @decryption_hash = {}

    # we are using a hash as a lookup table
    0.upto(decrypted_alphabet.size) do |index|
      @encryption_hash[decrypted_alphabet[index]] = encrypted_alphabet[index]
      @decryption_hash[encrypted_alphabet[index]] = decrypted_alphabet[index]
    end
  end

  def encrypt(string)
    # set up empty array to hold translated letters
    string.tr("a-z", @encryption_hash)
    # result = []
    # # loop through the given string and use each char as the key for the @encryption_hash hash
    # string.each_char do |c|
    #   # if the key is exists
    #   if @encryption_hash[c]
    #     # append the character to the results array
    #     result << @encryption_hash[c]
    #   # if the key is not in the hash Ruby returns nil (false)
    #   else
    #     # append the character to the results array as is
    #     result << c
    #   end
    # end
    # # take each item in the array and make them a string
    # result.join
  end

  def decrypt(string)
    result = []
    string.each_char do |c|
      if @decryption_hash[c]
        result << @decryption_hash[c]
      else 
        result << c
      end
    end
    result.join
  end
end

class CodeBreaker

  # This will contain the values to represent the commands
  COMMANDS = ["e", "d"]

  # clearing out some instance variables with empty strings
  # this is used to mean that no filename has been selected by the user yet or no password is being used
  # remember that in Ruby empty strings are true - only values that are false are nil and false
  def initialize
    @input_file   = ''
    @output_file  = ''
    @password     = ''
  end

  # rest of code goes here

  # the run method is the only entry point of the entire object
  # an entry point is just a starting place for some specific functionality of a program
  def run
    if get_command && get_input_file && get_output_file && get_secret
      process_files
      true
    else
      false
    end
  end

  def get_command
    print "Do you want to (e)ncrypt or (d)ecrypt a file? "
    # get a command from the user and convert to lowercase
    @command = gets.chomp.downcase
    # check to see if the user's input is in the COMMANDS array
    if !COMMANDS.include?(@command)
      puts "Unknown command, sorry"
      return false
    end
    true
  end

  def get_input_file
    print "Enter the name of the input file: "
    @input_file = gets.chomp
    # check to see if the files exist
    if !File.exists?(@input_file)
      puts "Can't find the input file, sorry!"
      return false
    end
    true
  end

  def get_output_file
    print "Enter the name of the output file: "
    @output_file = gets.chomp
    # check to see if the files exist
    if File.exists?(@output_file)
      puts "The output file already exists, can't overwrite!"
      return false
    end
    true
  end

  def get_secret
    print "Enter the secret password: "
    # Ruby returns the the results of the last statement of a method as the return value
    # In ruby, any value other than nil or false is considered true
    @password = gets.chomp
  end

  def process_files
    # instantiate an encoder object using the Caesar class
    encoder = Caesar.new(@password.size)
    # open an output file to hold the results of the algorithm
    File.open(@output_file, "w") do |output|
      # open the input file and read each line of the file
      IO.foreach(@input_file) do |line|
        # take the input line and convert it based on the user's choice of operations (e or d)
        converted_line = convert(encoder, line)
        # write out the line to store it in another file
        # usint puts here writes the contents of converted_line to output
        output.puts converted_line
      end
    end
  end

  def convert(encoder, string)
    if @command == 'e'
      encoder.encrypt(string)
    else
      encoder.decrypt(string)
    end
  end
end

puts "Code Breaker will encrypt or decrypt a file of your choice"
puts ""

codebreaker = CodeBreaker.new

if codebreaker.run
  puts "All done!"
else
  puts "Didn't work!"
end