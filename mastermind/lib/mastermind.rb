require_relative 'response'
require_relative 'output_generator'
require_relative 'input_parser'

class Mastermind

  #CODEGENERATOR##################################
  def generate_code
    secret = ["R", "B", "Y", "G"]
    secret.sample(4)
  end


  #GUESSVALIDATOR#################################
  def guess_validator(input)
    if !guess_four_chars?(input)
      puts "invalid guess"
      guess_valid = false
    else
      puts "valid guess"
      guess_valid = true
    end
  end

  def guess_four_chars?(guess)
    guess.length == 4
  end


  #SECRETEVALUATOR###################################
  def compare_positions(input, secret)
    secret = secret.dup
    input, secret = [input, secret].map!{|ar| ar.zip([0,1,2,3])}
    positions = (input & secret).length
    puts "positions : #{positions}"
    positions = (input & secret).length
  end


  def compare_colors(inputs, secret)
    count = 0
    secret = secret.dup
    inputs.each do |i|
      if secret.include? i
        match = secret.find_index(i)
          secret[match] = nil
          count += 1
        end
      end
      puts "count : #{count}"
    count
  end

end#class
