# Experiment with ASCII art shapes


def rectangle(height, width, outside_letter, inside_letter)
  #rectangle code will go here
  1.upto(height) do |row|
  #drawing code goes here
    if row == 1
      puts outside_letter * width
    elsif row == height
      puts outside_letter * width
    else
      middle = inside_letter * (width - 2)
      puts "#{outside_letter}#{middle}#{outside_letter}"
    end  
  end
end

def triangle(height, outside_letter, inside_letter)
  # triangle code will go here
  3.times do
    1.upto(height) do |row|
      # drawing code goes here
      print " " * (height - row)
      if row == 1
        puts "#{outside_letter * 2}"
      elsif row == height
        puts outside_letter * height * 2
      else
        middle = inside_letter * (row - 2)
        print "#{outside_letter}#{middle}#{inside_letter}"
        puts "#{inside_letter}#{middle}#{outside_letter}"
      end
    end
  end
end

def flipped_triangle(height, outside_letter, inside_letter)
  1.upto(height) do |row|
    print " " * (row)

    if row == 1
      puts outside_letter * height * 2
    elsif row == height
      puts "#{outside_letter * 2}"
    else 
      middle = inside_letter * (height - row)
      print "#{outside_letter}#{middle}"
      puts "#{middle}#{outside_letter}"
    end
  end
end

def right_triangle(height, outside_letter, inside_letter)
  1.upto(height) do |row|
    print " " * (height - row)
    if row == 1
      puts outside_letter * 2
    elsif row == height
      puts outside_letter * (height + 1)
    else
      middle = inside_letter * (row - 1)
      print "#{outside_letter}#{middle}"
      puts "#{outside_letter}"
    end
  end
end

def triangle_simple(height, letter)
  1.upto(height) do |row|
    print " " * (height - row)
    if row == 1
      puts "#{letter * 2}"
    elsif row == height
      puts letter * height * 2
    else
      middle = letter * (row - 1)
      print "#{letter}#{middle}"
      puts "#{middle}#{letter}"
    end
  end
end

def diamond(width)
  1.upto(width) do |row|
    no_of_spaces = width - row
    no_of_stars = row
    puts " " * no_of_spaces + "* " * no_of_stars  
  end
  (width + 1).upto(width * 2) do |row|
    no_of_spaces = row - width
    no_of_stars = 2 * width - row
    puts " " * no_of_spaces + "* " * no_of_stars
  end
end

def inverted_diamond(width)
  0.upto(width) do |row|
    no_of_stars = width - row
    no_of_spaces = row * 2
    print "* " * no_of_stars + " " * no_of_spaces
    puts " " * no_of_spaces + "* " * no_of_stars
    
  end
  (width + 1).upto(width * 2) do |row|
    no_of_stars = row - width
    no_of_spaces = 2 * width - row 
    print "* " * no_of_stars + " " * no_of_spaces 
    puts " " * no_of_spaces + "* " * no_of_stars 
  end
end



puts "Welcome to shapes"

# print "How big do you want your shape? "

# shape_size = gets.chomp



# print "Inside letter: "

# inside_letter = gets.chomp

puts "About to draw a shape #{shape_size} big"
# puts "using #{outside_letter} for the edge"
# puts "and #{inside_letter} for the inside"

height = shape_size.to_i
width = shape_size.to_i

# inverted_diamond(width)

fibonacci(0)





