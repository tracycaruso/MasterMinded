# runner = Runs Commands
# mastermind.rb = Business Logic
# response.rb = Decides if game should run or not
# output_generator.rb = Stores output


require './mastermind'

class Runner
  def run
    mastermind = Mastermind.new
    mastermind.start_game


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
