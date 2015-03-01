require '../lib/mastermind'

class Runner
  def run
  puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"

    mastermind = Mastermind.new
    response = nil

    until response && response.status == :end_game
      print "> "
      input = gets.chomp.downcase
      response = mastermind.menu(input)
      puts response.message
      if response.status == :play_again
        print "> "
        input = gets.chomp.downcase
        if input == "p"
          run
        else
          response = mastermind.quit
          puts response.message
          exit
        end#if
      end#if
    end#until

  end#run

end#runner

game = Runner.new
game.run
