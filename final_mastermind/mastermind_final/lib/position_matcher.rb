class PositionMatcher
  attr_reader :secret, :guess

  def initialize(secret, guess)
    @secret = secret
    @guess = guess.split("")
    @secret_length = @secret.length
  end

  def compare_positions
    secret = @secret.dup
    @guess, secret = [@guess, secret].map!{|ar| ar.zip(0..@secret_length).to_a}
    @positions_count = (@guess & secret).length
  end

  def full_match?
    @positions_count == @secret.length
  end
end
