class SecretGenerator
  attr_reader :secret_length

  def initialize(secret_length)
    @secret_length = secret_length
  end

  def generator
    (1..secret_length).to_a
  end

end
