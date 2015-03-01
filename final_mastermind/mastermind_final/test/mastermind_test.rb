require 'minitest/autorun'
require 'minitest/pride'
require '../lib/mastermind'


class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  def test_it_wins
    mm = Mastermind.new
    result = mm.execute(["b", "b", "g", "b"])
    assert result.message.downcase.include?("win")
  end

  def test_it_loses
    mm = Mastermind.new
    result = mm.execute(["b", "b", "b", "b"])
    assert result.message.downcase.include?("guess again")
  end

  def test_it_rejects_input_more_than_4_chars_long
    mm = Mastermind.new
    result = mm.execute(["b", "b", "b", "b", "b"])
    assert result.message.downcase.include?("too long")
  end

  def test_it_rejects_input_less_than_4_chars_long
    mm = Mastermind.new
    result = mm.execute(["b", "b", "b"])
    assert result.message.downcase.include?("too short")
  end

  def test_it_returns_secret_code
    mm = Mastermind.new
    result = mm.execute(["c", "h", "e", "a", "t"])
    assert result.message.include?("BBGB")
  end

  def test_it_returns_secret_code
    mm = Mastermind.new
    result = mm.execute(["c"])
    assert result.message.include?("BBGB")
  end

end
