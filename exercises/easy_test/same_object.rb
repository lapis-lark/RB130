require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class CustomArray < Array
  def process
    self.each { |ele| puts ele}
  end
end

class TestSame < MiniTest::Test
  def test_same
    x = CustomArray.new
    x << 5
    assert_same(x, x.process)
  end
end