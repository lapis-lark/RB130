require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class TypeTest < MiniTest::Test
  def test_numeric
    x = Numeric.new
    assert_instance_of(Numeric, x)
  end
end