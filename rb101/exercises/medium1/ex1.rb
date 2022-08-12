class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

=begin
  Ben is correct becaus attr_reader allows you to read the value of an instance variable in instance methods without using '@' because attr_reader creates a method inherently that allows the displays the value of an instance variable by using the method name.
=end