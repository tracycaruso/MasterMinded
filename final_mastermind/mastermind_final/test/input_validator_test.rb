require 'minitest/autorun'
require 'minitest/pride'
require '../lib/input_validator'

class InputValidatorTest < Minitest::Test
  def test_it_exists
    assert InputValidatorTest
  end

  def test_if_input_is_4_characters_validate
    input_validator = InputValidator.new("abcb", 4)
    assert input_validator.valid_answer?
  end

  def test_if_input_is_less_then_four_characters_refute_valid_answer
    input_validator = InputValidator.new("abc", 4)
    assert input_validator.less_than_length?
    refute input_validator.valid_answer?
  end

  def test_if_input_is_more_then_four_characters_refute_valid_answer
    input_validator = InputValidator.new("abcbc", 4)
    assert input_validator.more_than_length?
    refute input_validator.valid_answer?
  end

  def test_if_input_is_zero_characters_refute_valid_answer
    input_validator = InputValidator.new('\n', 4)
    assert input_validator.less_than_length?
    refute input_validator.valid_answer?
  end

  def test_it_it_passes_input_of_6_when_level_is_six
    input_validator = InputValidator.new("abcdef", 6)
    assert input_validator.valid_answer?
  end

  def test_it_it_rejects_input_of_5_when_level_is_six
    input_validator = InputValidator.new("abcde", 6)
    refute input_validator.valid_answer?
  end

  def test_it_it_rejects_input_of_7_when_level_is_six
    input_validator = InputValidator.new("abcdefg", 6)
    refute input_validator.valid_answer?
  end


  def test_it_it_passes_input_of_8_when_level_is_eight
    input_validator = InputValidator.new("abedefgh", 8)
    assert input_validator.valid_answer?
  end

  def test_it_it_rejects_input_of_7_when_level_is_eight
    input_validator = InputValidator.new("abedefg", 8)
    refute input_validator.valid_answer?
  end

  def test_it_it_rejects_input_of_9_when_level_is_eight
    input_validator = InputValidator.new("abedefghb", 8)
    refute input_validator.valid_answer?
  end

end
