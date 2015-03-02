class SecretGenerator
  attr_reader :secret_length

  def initialize(secret_length=4)
    @secret_length = secret_length
    end

  def generator
    secret_result = []
    if secret_length == 4
      @secret =  ["r", "b", "y", "g"]
        secret_length.times do
          secret_result << @secret.sample
      end
    elsif secret_length == 6
      @secret =  ["r", "b", "y", "g", "o", "r"]
        secret_length.times do
          secret_result << @secret.sample
        end

    elsif secret_length == 8
      @secret =  ["r", "b", "y", "g", "o", "r", "p", "f"]
        secret_length.times do
         secret_result << @secret.sample
        end
     end
      secret_result
  end#generator



end
