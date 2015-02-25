require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/mastermind'

class MastermindTest < Minitest::Test

  def setup
    @mm = Mastermind.new
  end

  def test_it_exists
    assert MastermindTest
  end

  def test_it_wins
    result = @mm.execute("BBGB")
    assert result.message.downcase.include?("win")
  end

  def test_start_message_plays_on_start_up
    assert_equal "Start", @mm.start_game
  end

  def test_game_starts_when_user_chooses_p_or_play
  skip
  end

  def test
  skip
  end


  def test
  skip
  end

  def test
  skip
  end

  def test
  skip
  end

  def test
  skip
  end

  def test
  skip
  end

  def test
  skip
  end

  def test
  skip
  end

  def test
  skip
  end

  def test
  skip
  end

  def test
  skip
  end

  def test
  skip
  end

  def test
  skip
  end
end
