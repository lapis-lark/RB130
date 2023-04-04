=begin
  create a clock class; the class itself should contain the hour/minute c vars
  create the following class methods
      #at - set the time to the arguments specified, 00:00 by default
      #to_s
      #+ - add time, handling any amount of minutes(accept minutes in integer form)
      #-
  DATA: Clock class, integers for hours minutes, output strings


=end

class Clock
  attr_accessor :hour, :minute

  def self.at(hour = 0, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
    self.clone
  end

  def to_s
    "#{"%02d" % hour}:#{"%02d" % minute}"
  end

  def +(plus_minutes)
    plus_hours = plus_minutes / 60
    plus_minutes %= 60
    added_hour = (hour + plus_hours) % 24
    added_hour += 1 if minute + plus_minutes >= 60
    added_minute = (minute + plus_minutes) % 60
    Clock.at(added_hour, added_minute)
  end

  def -(minutes)
    self + (-minutes)
  end

  def ==(other_clock)
    self.to_s == other_clock.to_s
  end

  private 
  attr_accessor :hour, :minute
end


puts clock = Clock.at(0, 30) - 60
