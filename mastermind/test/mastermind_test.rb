require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/mastermind'

class MastermindTest < Minitest::Test

  attr_reader :master_mind, :output_gen, :input_pars

  def setup
    @master_mind = Mastermind.new
    @output_gen = OutputGenerator.new
    @input_pars = InputParser.new
  end

  def test_it_exists
    assert MastermindTest
  end

  def test_it_wins
    result = master_mind.execute("BBGB")
    assert result.message.downcase.include?("win")
  end

  def test_it_responds_to_start_squence
    assert master_mind.respond_to?(:start_game)
  end

  def test_it_plays_start_message
    assert output_gen.respond_to?(:start_message)
  end

  def test_it_checks_if_player_wants_to_play
    assert input_pars.respond_to?(:player_menu_selection)
  end

  def test_it_evaluates_player_menu_selection
    assert master_mind.respond_to?(:eval_menu_selection)
  end

  def test_game_starts_when_player_chooses_p_or_play
    assert_equal "play", master_mind.eval_menu_selection("p")
  end

  def test_game_prints_instructions_when_player_chooses_i_or_instructions
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
