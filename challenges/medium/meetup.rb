=begin
  PROBLEM:
    create a Meetup class which accepts a year and a month
    create a #day instance method which accepts a day and a descriptor (case insensitive)
    #day returns a Date object which matches the criteria

  EXAMPLES:
    return nil if the date described does not exist (e.g. fifth sunday, but only four that month)


  DATA:
    Date objects
    strings
    ints

  ALGO:
    write #new method which sets up instance vars for year, month
    #day
      generate arr of all that day of week in given month/year
      return appropriate date from arr based on the descriptor


=end

require 'date'

class Meetup
  attr_reader :year, :month
  attr_accessor :date
  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.new(year, month)
  end

  def day(day_of_week, descriptor)
    days = day_of_week_array(day_of_week)
    case descriptor.downcase
    when 'first' then days.first
    when 'second' then days[1]
    when 'third' then days[2]
    when 'fourth' then days[3]
    when 'fifth' then days[4]
    when 'last' then days[-1]
    when 'teenth' then teenth(days)
    end
  end

  private
  def day_of_week_array(day_of_week)
    days = []
    until date.month != month
      days << date
      self.date = date.next_day
    end

    days.select(&("#{day_of_week.downcase}?".to_sym))
  end

  def teenth(days)
    days.select { |d| (13..19) === d.day }.first
  end
end

puts (Date.civil(2016, 8, 27) == Meetup.new(2016, 8).day('Saturday', 'last'))