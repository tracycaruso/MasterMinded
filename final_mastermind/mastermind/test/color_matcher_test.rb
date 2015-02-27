require 'minitest/autorun'
require 'minitest/pride'
require '../lib/color_matcher'

class ColorMatcherTest < Minitest::Test
  def test_it_exists
    assert ColorMatcherTest
  end

  def test_no_match
    #ColorMatcher.new(secret, guess)
    color_matcher = ColorMatcher.new(['b', 'r', 'r', 'y'], ['g', 'g', 'g', 'g'])
    assert_equal 0, color_matcher.compare_colors
    refute color_matcher.full_match?
  end

  def test_one_match
    #ColorMatcher.new(secret, guess)
    color_matcher = ColorMatcher.new(['b', 'r', 'r', 'y'], ['g', 'g', 'g', 'y'])
    assert_equal 1, color_matcher.compare_colors
    refute color_matcher.full_match?
  end

  def test_two_match
    #ColorMatcher.new(secret, guess)
    color_matcher = ColorMatcher.new(['b', 'r', 'r', 'y'], ['g', 'g', 'r', 'y'])
    assert_equal 2, color_matcher.compare_colors
    refute color_matcher.full_match?
  end

  def test_three_match
    #ColorMatcher.new(secret, guess)
    color_matcher = ColorMatcher.new(['b', 'r', 'r', 'y'], ['g', 'r', 'r', 'y'])
    assert_equal 3, color_matcher.compare_colors
    refute color_matcher.full_match?
  end

  def test_four_match
    #ColorMatcher.new(secret, guess)
    color_matcher = ColorMatcher.new(['g', 'r', 'r', 'y'], ['g', 'r', 'r', 'y'])
    assert_equal 4, color_matcher.compare_colors
    assert color_matcher.full_match?
  end

  def test_five_match
    #ColorMatcher.new(secret, guess)
    color_matcher = ColorMatcher.new(['g', 'r', 'r', 'y', 'g'], ['g', 'r', 'r', 'y', 'g'])
    assert_equal 5, color_matcher.compare_colors
    assert color_matcher.full_match?
  end

  def test_six_match
    #ColorMatcher.new(secret, guess)
    color_matcher = ColorMatcher.new(['g', 'r', 'r', 'y', 'g', 'y'], ['g', 'r', 'r', 'y', 'g', 'y'])
    assert_equal 6, color_matcher.compare_colors
    assert color_matcher.full_match?
  end

  def test_recognizes_multiples_of_one_color
    #ColorMatcher.new(secret, guess)
    color_matcher = ColorMatcher.new(['g', 'g', 'g','g'], ['g', 'g', 'g', 'g'])
    assert_equal 4, color_matcher.compare_colors
    assert color_matcher.full_match?
  end

  def test_recognizes_multiples_of_two_color
    #ColorMatcher.new(secret, guess)
    color_matcher = ColorMatcher.new(['r', 'r', 'g','g'], ['r', 'r', 'g', 'g'])
    assert_equal 4, color_matcher.compare_colors
    assert color_matcher.full_match?
  end
end
