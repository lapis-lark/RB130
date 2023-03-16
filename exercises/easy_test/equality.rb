require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class EqualTest < MiniTest::Test
  def test_downcase
    assert_equal('xyz', 'XYZ'.downcase)
  end
end