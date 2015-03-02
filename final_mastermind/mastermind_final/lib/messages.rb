require_relative 'response'

class Messages

  ###MENU_RESPONSES#########################################################################################
  def instructions
    Response.new(:message => "Detailed Instructions", :status => :continue)
  end

  def difficulty
    Response.new(:message => "What level of difficulty would you like to play? (e)asy, (m)edium or (h)ard", :status => :continue)
  end

  def play_easy
    Response.new(:message => "I have generated a beginner sequence with four elements made up of:\n(r)ed, (g)reen, (b)lue, and (y)ellow. \nUse (q)uit at any time to end the game.\nWhat's your guess?", :status => :continue)
  end

  def play_medium
    Response.new(:message => "I have generated a medium sequence with six elements made up of:\n(r)ed, (g)reen, (b)lue, and (y)ellow, (o)range. \nUse (q)uit at any time to end the game.\nWhat's your guess?", :status => :continue)
  end

  def play_hard
    Response.new(:message => "I have generated a hard sequence with eight elements made up of:\n(r)ed, (g)reen, (b)lue, and (y)ellow, (o)range, (p)urple. \nUse (q)uit at any time to end the game.\nWhat's your guess?", :status => :continue)
  end

  def cheat(secret)
    Response.new(:message => secret.join.upcase, :status => :continue)
  end

  def quit
    response = Response.new(:message => "Goodbye!", :status => :end_game)
    puts response.message
    exit
  end

  def too_long
    Response.new(:message => "too long", :status => :continue)
  end

  def too_short
    Response.new(:message => "too short", :status => :continue)
  end


  def win(secret, guesses, minutes, seconds)
    Response.new(:message => "Congratulations! You guessed the sequence '#{secret.join.upcase}' in #{guesses} guesses over #{minutes} minutes and #{seconds} seconds.\nDo you want to (p)lay again or (q)uit?", :status => :play_again)
  end

  def try_again(input, correct_positions, correct_colors)
    Response.new(:message => "#{input.upcase} has #{correct_colors} of the correct elements with #{correct_positions} in the correct positions. Please guess again.", :status => :continue)
  end




end
