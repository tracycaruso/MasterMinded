require 'minitest/autorun'
require 'minitest/pride'
require '../lib/mastermind'


class MastermindTest < Minitest::Test
  def test_it_exists
    assert MastermindTest
  end

  #activate easy secret
  def test_it_wins_easy
    skip
    mm = Mastermind.new
    result = mm.validate("bbgb", 4)
    assert result.message.downcase.include?("congratulations")
  end

  #activate easy secret
  def test_it_loses_easy
    skip
    mm = Mastermind.new
    result = mm.validate("bbbb", 4)
    assert result.message.downcase.include?("guess again")
  end

  #activate medium secret
  def test_it_wins_medium
    skip
    mm = Mastermind.new
    result = mm.validate("bbgbbo", 6)
    assert result.message.downcase.include?("congratulations")
  end

  #activate medium secret
  def test_it_loses_medium
    skip
    mm = Mastermind.new
    result = mm.validate("bbbbbb", 6)
    assert result.message.downcase.include?("guess again")
  end

  #activate hard secret
  def test_it_wins_hard
    skip
    mm = Mastermind.new
    result = mm.validate("bbgbropg", 8)
    assert result.message.downcase.include?("congratulations")
  end

  #activate hard secret
  def test_it_loses_hard
    skip
    mm = Mastermind.new
    result = mm.validate("bbbbbbbb", 8)
    assert result.message.downcase.include?("guess again")
  end

  #pre adding game levels
  def test_it_rejects_input_more_than_4_chars_long
    skip
    mm = Mastermind.new
    result = mm.execute("bbbbb")
    assert result.message.downcase.include?("too long")
  end

  #pre adding game levels
  def test_it_rejects_input_less_than_4_chars_long
    skip
    mm = Mastermind.new
    result = mm.execute("bbb")
    assert result.message.downcase.include?("too short")
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

  #pre adding game levels
  def test_it_prints_play_message_with_p
    skip
    mm = Mastermind.new
    result = mm.menu("p")
    assert result.message.downcase.include?("what's your guess")
  end

  #pre adding game levels
  def test_it_prints_play_message_with_play
    skip
    mm = Mastermind.new
    result = mm.menu("play")
    assert result.message.downcase.include?("what's your guess")
  end

  #activate easy secret
  def test_it_returns_secret_code_with_cheat
    skip
    mm = Mastermind.new
    result = mm.menu("cheat")
    assert result.message.downcase.include?("bbgb")
  end

  #activate easy secret
  def test_it_returns_secret_code_with_c
    skip
    mm = Mastermind.new
    result = mm.menu("c")
    assert result.message.downcase.include?("bbgb")
  end

  def test_easy_level_is_equal_to_4
    mm = Mastermind.new
    mm.menu("easy")
    assert_equal 4, mm.level
  end

  def test_e_level_is_equal_to_4
    mm = Mastermind.new
    mm.menu("e")
    assert_equal 4, mm.level
  end

  def test_easy_level_secret_has_a_length_of_four
    mm = Mastermind.new
    mm.menu("easy")
    assert_equal 4, mm.secret.length
  end


  def test_e_level_secret_has_a_length_of_four
    mm = Mastermind.new
    mm.menu("e")
    assert_equal 4, mm.secret.length
  end


  def test_medium_level_is_equal_to_6
    mm = Mastermind.new
    mm.menu("medium")
    assert_equal 6, mm.level
  end

  def test_m_level_is_equal_to_6
    mm = Mastermind.new
    mm.menu("m")
    assert_equal 6, mm.level
  end


  def test_medium_level_secret_has_a_length_of_six
    mm = Mastermind.new
    mm.menu("medium")
    assert_equal 6, mm.secret.length
  end

  def test_m_level_secret_has_a_length_of_six
    mm = Mastermind.new
    mm.menu("m")
    assert_equal 6, mm.secret.length
  end



  def test_hard_level_is_equal_to_8
    mm = Mastermind.new
    mm.menu("hard")
    assert_equal 8, mm.level
  end

  def test_h_level_is_equal_to_8
    mm = Mastermind.new
    mm.menu("h")
    assert_equal 8, mm.level
  end

  def test_hard_level_secret_has_a_length_of_eight
    mm = Mastermind.new
    mm.menu("hard")
    assert_equal 8, mm.secret.length
  end

  def test_h_level_secret_has_a_length_of_eight
    mm = Mastermind.new
    mm.menu("h")
    assert_equal 8, mm.secret.length
  end

  def test_when_p_is_selected_game_levels_are_shown
    mm = Mastermind.new
    result = mm.menu("p")
    assert result.message.downcase.include?("what level of difficulty")
  end

  def test_when_play_is_selected_game_levels_are_shown
    mm = Mastermind.new
    result = mm.menu("play")
    assert result.message.downcase.include?("what level of difficulty")
  end

  #breaks out of tests
  def test_it_quits_game_with_q
    skip
    mm = Mastermind.new
    result = mm.menu("q")
    assert result.message.downcase.include?("goodbye")
  end

  #breaks out of tests
  def test_it_quits_game_with_quit
    skip
    mm = Mastermind.new
    result = mm.menu("quit")
    assert result.message.downcase.include?("goodbye")
  end

  #not sure how to test
  def test_it_it_passes_input_of_4_when_level_is_four
    skip
    mm = Mastermind.new
    mm.validate("bbbb", 4)
    assert result.message.downcase.include?()
  end

  def test_it_it_rejects_input_of_3_when_level_is_four
    mm = Mastermind.new
    result = mm.validate("bbb", 4)
    assert result.message.downcase.include?("too short")
  end

  def test_it_it_rejects_input_of_5_when_level_is_four
    mm = Mastermind.new
    result = mm.validate("bbbbb", 4)
    assert result.message.downcase.include?("too long")
  end

  #not sure how to test
  def test_it_it_passes_input_of_6_when_level_is_six
    skip
    mm = Mastermind.new
    result = mm.validate("bbbbbb", 6)
    assert result.message.downcase.include?()
  end

  def test_it_it_rejects_input_of_5_when_level_is_six
    mm = Mastermind.new
    result = mm.validate("bbbbb", 6)
    assert result.message.downcase.include?("too short")
  end

  def test_it_it_rejects_input_of_7_when_level_is_six
    mm = Mastermind.new
    result = mm.validate("bbbbbbb", 6)
    assert result.message.downcase.include?("too long")
  end

  #not sure how to test
  def test_it_it_passes_input_of_8_when_level_is_eight
    skip
    mm = Mastermind.new
    result = mm.validate("bbbbbbbb", 8)
    assert result.message.downcase.include?()
  end

  def test_it_it_rejects_input_of_7_when_level_is_eight
    mm = Mastermind.new
    result = mm.validate("bbbbbbb", 8)
    assert result.message.downcase.include?("too short")
  end

  def test_it_it_rejects_input_of_9_when_level_is_eight
    mm = Mastermind.new
    result = mm.validate("bbbbbbbbb", 8)
    assert result.message.downcase.include?("too long")
  end

end
