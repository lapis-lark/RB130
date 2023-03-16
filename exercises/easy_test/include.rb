require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class TestInclude < MiniTest::Test
  def test_include
    assert_includes(['abc', 'xyz'], 'xyz')
  end
end
