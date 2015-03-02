class SecretGenerator
  attr_reader :secret_length

  def initialize(secret_length=4)
    @secret_length = secret_length
    @secret = ["r", "b", "y", "g" ]
  end

  def generator

    if secret_length == 6
      @secret = ["r", "b", "y", "g", "o", "o" ]
    elsif secret_length == 8
      @secret = ["r", "b", "y", "g", "o", "p", "r", "y"]
    end

    @secret.sample(@secret_length)

  end

end
