require_relative 'output_generator'

class Response
  attr_reader :message, :status

  def initialize(inputs)
    @message = inputs[:message]
    @status  = inputs[:status]
  end

  def starting_message
    "Start"
  end


end
