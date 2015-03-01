class ColorMatcher
  attr_reader :secret, :guess

  def initialize(secret, guess)
    @secret = secret
    @guess = guess.split("")
  end

  def compare_colors
    @color_count = 0
    secret = @secret.dup
    @guess.each do |i|
      if secret.include? i
        match = secret.find_index(i)
          secret[match] = nil
          @color_count += 1
        end
      end
    @color_count
  end

  def full_match?
    @color_count == @secret.length
  end

end
