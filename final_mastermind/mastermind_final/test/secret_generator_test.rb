require 'minitest/autorun'
require 'minitest/pride'
require '../lib/secret_generator'

class SecretGeneratorTest < Minitest::Test
  def test_it_exists
    assert SecretGeneratorTest
  end

  def test_it_holds_an_array
    secret_generator = SecretGenerator.new(1)
    assert Array, secret_generator.generator.class
  end

  def test_in_can_generate_two_letters
    secret_generator = SecretGenerator.new(2)
    assert 2, secret_generator.generator.length
  end

  def test_in_can_generate_four_letters
    secret_generator = SecretGenerator.new(4)
    assert 4, secret_generator.generator.length
  end

  def test_in_can_generate_six_letters
    secret_generator = SecretGenerator.new(6)
    assert 6, secret_generator.generator.length
  end

  def test_in_can_generate_ten_letters
    secret_generator = SecretGenerator.new(10)
    assert 10, secret_generator.generator.length
  end
end
