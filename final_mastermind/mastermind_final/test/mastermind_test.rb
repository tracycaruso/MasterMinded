require 'minitest/autorun'
require 'minitest/pride'
require '../lib/mastermind'


class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_wins
    mm = Mastermind.new
    secret = "BBGB"
    result = mm.execute("BBGB")
    assert result.message.downcase.include?("win")
  end

  def test_it_loses
    mm = Mastermind.new
    result = mm.execute("BBBB")
    assert result.message.downcase.include?("guess again")
  end

  def it_rejects_input_more_than_4_chars_long
    mm = Mastermind.new
    result = mm.execute("BBGGG")
    assert result.message.downcase.include?("too long")
  end

  def it_rejects_input_less_than_
end
