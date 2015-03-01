require 'minitest/autorun'
require 'minitest/pride'
require '../lib/input_validator'

class InputValidatorTest < Minitest::Test
  def test_it_exists
    assert InputValidatorTest
  end

  def test_if_input_is_4_characters_validate
    input_validator = InputValidator.new("abcb")
    assert input_validator.valid_answer?
  end

  def test_if_input_is_less_then_four_characters_refute_valid_answer
    input_validator = InputValidator.new("abc")
    assert input_validator.less_than_four?
    refute input_validator.valid_answer?
  end

  def test_if_input_is_more_then_four_characters_refute_valid_answer
    input_validator = InputValidator.new("abcbc")
    assert input_validator.more_than_four?
    refute input_validator.valid_answer?
  end

  def test_if_input_is_zero_characters_refute_valid_answer
    input_validator = InputValidator.new('\n')
    assert input_validator.less_than_four?
    refute input_validator.valid_answer?
  end
end
