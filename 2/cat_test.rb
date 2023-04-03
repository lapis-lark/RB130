require 'minitest/autorun'

require_relative 'cat'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_is_cat; end

  def test_name; end

  def test_miaow; end

  def test_raises_error
    assert_raises do
      Cat.new
    end
  end
end