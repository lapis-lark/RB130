require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class RefutationsTest < MiniTest::Test
  def test_refutations
    refute_includes(['abc', 'def'], 'xyz')
  end
end