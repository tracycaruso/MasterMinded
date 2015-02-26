require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
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

  def test_it_plays_start_message
    assert output_gen.respond_to?(:start_message)
  end

  def test_it_checks_if_player_wants_to_play
    assert input_pars.respond_to?(:player_input)
  end

  def test_game_starts_when_player_chooses_p_or_play
    skip
    assert_equal :play, master_mind.eval_menu_selection("p")
    assert_equal :play, master_mind.eval_menu_selection("play")
  end

  def test_game_prints_instructions_when_player_chooses_i_or_instructions
    skip
    assert_equal :instructions, master_mind.eval_menu_selection("i")
    assert_equal :instructions, master_mind.eval_menu_selection("instructions")
  end

  def test_game_prints_instructions_when_player_chooses_q_or_quit
    skip
    assert_equal :quit, master_mind.eval_menu_selection("q")
    assert_equal :quit, master_mind.eval_menu_selection("quit")
  end

  def test_it_prints_basic_instructions
    assert output_gen.respond_to?(:basic_instructions)
  end

  def test_it_prints_indepth_instructions
    assert output_gen.respond_to?(:indepth_instructions)
  end

  def test_it_quits_game
    assert master_mind.respond_to?(:quit)
  end

  def test_it_generates_a_secret_code
    assert master_mind.respond_to?(:generate_code)
  end

  def test_it_gets_guess_from_player
    assert master_mind.respond_to?(:execute)
  end

  # def test_it_wins
  #   result = master_mind.execute("BBGB")
  #   assert result.message.downcase.include?("win")
  # end

  def test_it_makes_sure_guess_is_valid
    assert master_mind.valid_guess?("GYBR")
  end

  def test_guess_is_the_right_length
    assert master_mind.guess_four_chars?("GYBR")
    refute master_mind.guess_four_chars?("GHDJF")
  end

  def test_guess_is_only_allowed_characters
    assert master_mind.guess_allowed_chars?("GYBR")
  end

  def test_evaluates_guess
   assert master_mind.guess_validator("BBBB")
   refute master_mind.guess_validator("BBBBB")
  end

  def test_it_gives_cheat_code
    assert_equal "BBGB", master_mind.cheat(["B", "B", "G", "B"])
  end

  def test_compares_positions
    #compare_positions(player_input, game_secret)
    assert_equal "1 in the correct positions", master_mind.compare_positions("RRRB", "BBBB")
    assert_equal "2 in the correct positions", master_mind.compare_positions("RRBB", "BBBB")
    assert_equal "3 in the correct positions", master_mind.compare_positions("RBBB", "BBBB")
    assert_equal "4 in the correct positions", master_mind.compare_positions("BBBB", "BBBB")
  end
end
#
# class MastermindStubTest < Minitest::Mock
#   attr_reader :master_mind, :output_gen, :input_pars
#
#   def setup
#     @master_mind = Mastermind.new
#     @output_gen = OutputGenerator.new
#     @input_pars = InputParser.new
#   end
#
#   def test_compares_positions
#     skip
#     @mock.expect(:secret, "BBBB")
#     assert_equal "2 in the correct positions", master_mind.compare_positions("RRBB")
#   end
# end
