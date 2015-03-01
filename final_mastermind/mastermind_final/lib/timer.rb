class Timer
  def start_time
    @t1 = Time.now
  end

  def end_time
    @t2 = Time.now
  end

  def diff_in_seconds
    @t2.sec - @t1.sec
  end

  def diff_in_minutes
    @t2.min - @t1.min
  end

end
