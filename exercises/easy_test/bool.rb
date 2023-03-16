require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'
SimpleCov.start
Minitest::Reporters.use!

class BoolTest < MiniTest::Test
  def test_odd?
    value = 4
    assert(value.odd?, 'not odd :(')
  end

end