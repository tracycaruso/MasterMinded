class Timer
  def start_time
    Time.now
  end

  def end_time
    Time.new
  end

  def final_time
    start_time - end_time
  end
end
