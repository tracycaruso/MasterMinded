class InputValidator
  attr_reader :input

  def initialize(input)
    @input = input
    @input_length = input.length
  end

  def less_than_four?
    @input_length < 4
  end

  def more_than_four?
    @input_length > 4
  end

  def valid_answer?
    !less_than_four? && !more_than_four?
  end

end
