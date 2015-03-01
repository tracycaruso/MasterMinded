class GuessCounter

  attr_accessor :number

  def initialize
    @number = 0
  end

  def guess_number
    @number += 1
  end
end
