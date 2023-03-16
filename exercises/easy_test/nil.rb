require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class NilTest < MiniTest::Test
  def test_nil
    assert_nil(nil)
  end
end