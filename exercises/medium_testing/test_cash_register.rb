require 'minitest/autorun'
require "minitest/reporters"
require 'simplecov'
# SimpleCov.start
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(500.0)
    @headphones = Transaction.new(36.99)
  end

  def test_accept_money
    # @headphones.prompt_for_payment
    # @register.accept_money(@headphones)
    # assert_equal(536.99, @register.total_money)
  end

  def test_change
    # @headphones.prompt_for_payment
    # item_cost = @headphones.item_cost
    # paid = @headphones.amount_paid
    # change = paid - item_cost
    # assert_equal(change, @register.change(@headphones))
  end

  def test_give_receipt
    assert_output("You've paid $#{@headphones.item_cost}.\n") do 
      @register.give_receipt(@headphones)
    end
  end

  def test_prompt_for_payment
    input = StringIO.new("40\n")
    output = StringIO.new
    @headphones.prompt_for_payment(input: input, output: output)
    assert_equal(40, @headphones.amount_paid)
  end

end