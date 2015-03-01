require 'minitest/autorun'
require 'minitest/pride'
require '../lib/position_matcher'

class PositionMatcherTest < Minitest::Test
  def test_it_exists
    assert PositionMatcherTest
  end

  def test_no_match
    #PositionMatcher.new(secret, guess)
    position_matcher = PositionMatcher.new(['b', 'r', 'r', 'y'], "gggg")
    assert_equal 0, position_matcher.compare_positions
    refute position_matcher.full_match?
  end

  def test_one_match
    #PositionMatcher.new(secret, guess)
    position_matcher = PositionMatcher.new(['b', 'r', 'r', 'y'], "gggy")
    assert_equal 1, position_matcher.compare_positions
    refute position_matcher.full_match?
  end

  def test_two_match
    #PositionMatcher.new(secret, guess)
    position_matcher = PositionMatcher.new(['b', 'r', 'r', 'y'], "ggry")
    assert_equal 2, position_matcher.compare_positions
    refute position_matcher.full_match?
  end


  def test_three_match
    #PositionMatcher.new(secret, guess)
    position_matcher = PositionMatcher.new(['b', 'r', 'r', 'y'], "grry")
    assert_equal 3, position_matcher.compare_positions
    refute position_matcher.full_match?
  end

  def test_four_match
    #PositionMatcher.new(secret, guess)
    position_matcher = PositionMatcher.new(['g', 'r', 'r', 'y'], "grry")
    assert_equal 4, position_matcher.compare_positions
    assert position_matcher.full_match?
  end

  def test_five_match
    #PositionMatcher.new(secret, guess)
    position_matcher = PositionMatcher.new(['g', 'r', 'g', 'g', 'r'], "grggr")
    assert_equal 5, position_matcher.compare_positions
    assert position_matcher.full_match?
  end

  def test_six_match
    #PositionMatcher.new(secret, guess)
    position_matcher = PositionMatcher.new(['g', 'g', 'g', 'g', 'g', 'r'], "gggggr")
    assert_equal 6, position_matcher.compare_positions
    assert position_matcher.full_match?
  end

end
