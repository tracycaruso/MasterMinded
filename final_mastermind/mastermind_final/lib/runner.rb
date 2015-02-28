require '../lib/mastermind'

class Runner
  def run
  puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"

    ### IF NOT QUIT
    mastermind = Mastermind.new
    response = nil

    until response && response.status == :won
      print "> "
      input = gets.chomp.downcase.split('')
      response = mastermind.execute(input)
      puts response.message
    end
    puts "Goodbye!"
  end
end

game = Runner.new
game.run
