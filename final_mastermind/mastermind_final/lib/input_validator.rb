class InputValidator
  attr_reader :input, :input_length, :level

  def initialize(input, level)
    @input = input
    @input_length = @input.length
    @level = level
  end

  def less_than_length?
    input_length < level
  end

  def more_than_length?
    input_length > level
  end

  def valid_answer?
    !less_than_length? && !more_than_length?
  end

end
