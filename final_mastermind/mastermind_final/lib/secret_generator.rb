class SecretGenerator
  attr_reader :secret_length

  def initialize(secret_length=4)
    @secret_length = secret_length
    @secret = ["r", "b", "y", "g" ]
  end

  def generator
    @secret.sample(@secret_lengt)
  end

end
