#!/usr/bin/env ruby
require '../lib/mastermind'
require '../lib/start_title'


class Runner
  def run
  puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"

    mastermind = Mastermind.new
    response = nil
    start = StartTitle.new
    

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
          mastermind.quit
        end#if
      end#if
    end#until

  end#run

end#runner

game = Runner.new
game.run
