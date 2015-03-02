require 'minitest/autorun'
require 'minitest/pride'
require '../lib/secret_generator'

class SecretGeneratorTest < Minitest::Test
  def test_it_exists
    assert SecretGeneratorTest
  end

  #before adding levels
  def test_it_holds_an_array
    skip
    secret_generator = SecretGenerator.new(1)
    assert_equal Array, secret_generator.generator.class
  end

  #before adding leveles
  def test_in_can_generate_two_letters
    skip
    secret_generator = SecretGenerator.new(2)
    assert_equal 2, secret_generator.generator.length
  end

  def test_in_defaults_to_easy_4_elements
    secret_generator = SecretGenerator.new
    assert_equal 4, secret_generator.generator.length
  end

  def test_in_can_generate_four_letters
    secret_generator = SecretGenerator.new(4)
    assert_equal 4, secret_generator.generator.length
  end

  def test_in_can_generate_six_letters
    secret_generator = SecretGenerator.new(6)
    assert_equal 6, secret_generator.generator.length
  end

  def test_in_can_generate_eight_letters
    secret_generator = SecretGenerator.new(8)
    assert_equal 8, secret_generator.generator.length
  end
end
