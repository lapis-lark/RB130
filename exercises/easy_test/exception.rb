require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  attr_accessor :hired, :experience
  def initialize
    @hired = false
    @experience = false
  end

  def hire
    raise NoExperienceError unless self.experience 
    self.hired = true
  end
end

class ExceptionTest < MiniTest::Test
  def test_no_experience
    dan = Employee.new
    assert_raises(NoExperienceError) do
      dan.hire
    end
  end
end