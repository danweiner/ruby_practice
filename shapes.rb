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
puts "Welcome to shapes"

print "How big do you want your shape? "

shape_size = gets.chomp

print "Outside letter: "

outside_letter = gets.chomp

print "Inside letter: "

inside_letter = gets.chomp

puts "About to draw a shape #{shape_size} big"
puts "using #{outside_letter} for the edge"
puts "and #{inside_letter} for the inside"

height = shape_size.to_i
width = shape_size.to_i


triangle(height, outside_letter, inside_letter)
rectangle(height, width * 2, outside_letter, inside_letter)
right_triangle(height, outside_letter, inside_letter)
flipped_triangle(height, outside_letter, inside_letter)


