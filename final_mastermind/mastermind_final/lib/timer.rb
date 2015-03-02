class Timer
  def start_time
    @t1 = Time.now
  end

  def end_time
    @t2 = Time.now
  end

  def time_diff
    diff = @t2 - @t1
    minutes = (diff/60).to_i
    seconds = ((( diff/60 ) - minutes) * 60).to_i
    time = [minutes,seconds]
  end

end
