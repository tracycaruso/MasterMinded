require '../lib/mastermind'

class Runner
  def run
  puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"

    mastermind = Mastermind.new
    response = nil

    until response && response.status == :end_game
      print "> "
      input = gets.chomp.downcase
      response = mastermind.execute(input)
      puts response.message
    end
  end
end

game = Runner.new
game.run
