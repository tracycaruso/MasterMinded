# runner = Runs Commands
# mastermind.rb = Business Logic
# response.rb = Decides if game should run or not
# output_generator.rb = Stores output


# runner, printer,  mastermind: code gen, guess validator, guess evaluator


require './mastermind'

class Runner
  def run
    mastermind = Mastermind.new
    mastermind.start_game
    mastermind.execute

    # response = nil
    # until response && response.status == :won
    #    print "> "
    #    input = gets.chomp
    #    response = mastermind.execute(input)
    #    puts response.message
    #  end
    #  puts "Goodbye!"
  end
end


game = Runner.new
game.run
