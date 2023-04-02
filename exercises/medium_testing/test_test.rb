require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'
# SimpleCov.start
Minitest::Reporters.use!

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @file = File.new('lorem.txt', 'r')
    @lorem = Text.new(@file.read)
  end

  def test_swap
    assert_equal(File.read('swapped.txt'), @lorem.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(72, @lorem.word_count)
  end

  def teardown
    @file.close
  end
end