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
  @@hour = 0
  @@minute = 0

  def self.to_s
    "#{"%02d" % @@hour}:#{"%02d" % @@minute}"
  end

  def self.at(hour = 0, minute = 0)
    @@hour = hour
    @@minute = minute
    self.clone
  end

  def self.+(minutes)
    hours = minutes / 60
    minutes %= 60
    added_hour = (@@hour + hours) % 24
    added_hour += 1 if @@minute + minutes >= 60
    added_minute = (@@minute + minutes) % 60
    "#{"%02d" % added_hour}:#{"%02d" % added_minute}"
  end

  def self.-(minutes)
    self.+(-minutes)
  end

  def self.==(other_clock)
    self.to_s == other_clock.to_s
  end
end

clock1 = Clock.at(15, 37)
clock2 = Clock.at(15, 36)

puts clock1
puts clock2
puts clock1 == clock2
