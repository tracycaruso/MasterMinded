require 'minitest/autorun'
require 'minitest/pride'
require '../lib/mastermind'


class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_wins
    mm = Mastermind.new
    result = mm.execute("bbgb")
    assert result.message.downcase.include?("congratulations")
  end

  def test_it_loses
    mm = Mastermind.new
    result = mm.execute("bbbb")
    assert result.message.downcase.include?("guess again")
  end

  def test_it_rejects_input_more_than_4_chars_long
    mm = Mastermind.new
    result = mm.execute("bbbbb")
    assert result.message.downcase.include?("too long")
  end

  def test_it_rejects_input_less_than_4_chars_long
    mm = Mastermind.new
    result = mm.execute("bbb")
    assert result.message.downcase.include?("too short")
  end

  def test_it_quits_game_with_q
    mm = Mastermind.new
    result = mm.menu("q")
    assert result.message.downcase.include?("goodbye")
  end

  def test_it_quits_game_with_quit
    mm = Mastermind.new
    result = mm.menu("quit")
    assert result.message.downcase.include?("goodbye")
  end

  def test_it_prints_instructions_with_i
    mm = Mastermind.new
    result = mm.menu("i")
    assert result.message.downcase.include?("instructions")
  end

  def test_it_prints_instructions_with_instructions
    mm = Mastermind.new
    result = mm.menu("instructions")
    assert result.message.downcase.include?("instructions")
  end

  def test_it_prints_play_message_with_p
    mm = Mastermind.new
    result = mm.menu("p")
    assert result.message.downcase.include?("what's your guess")
  end

  def test_it_prints_play_message_with_play
    mm = Mastermind.new
    result = mm.menu("play")
    assert result.message.downcase.include?("what's your guess")
  end

  def test_it_returns_secret_code_with_cheat
    mm = Mastermind.new
    result = mm.menu("cheat")
    assert result.message.downcase.include?("bbgb")
  end

  def test_it_returns_secret_code_with_c
    mm = Mastermind.new
    result = mm.menu("c")
    assert result.message.downcase.include?("bbgb")
  end

end
