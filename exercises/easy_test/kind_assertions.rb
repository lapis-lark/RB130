require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class KindTest < MiniTest::Test
  def test_kind
    y = 5
    assert_kind_of(Numeric, y)
  end
end 
