class InputValidator
  attr_reader :input

  def initialize(input)
    @input = input
    @input_length = input.length
  end

  def less_than_four?
    @input_length < 4 && @input != ["c"]
  end

  def more_than_four?
    @input_length > 4 && @input != ["c", "h", "e", "a", "t"]
  end

  def valid_answer?
    !less_than_four? && !more_than_four?
  end

end
