class Vending
  attr_reader :coins

  def initialize()
    @coins = []
  end

  def insert_money(coin)
    @coins << coin
  end

  def coin_return
    @coins.shift(@coins.count)
  end

  # [:dime, :dime, :nickel]
  def get_a
    current_amount = coin_amount
    if current_amount <= 0.65
      return nil, coin_return
    end

    new_amount = current_amount - 0.65
    change = make_change(new_amount)
    return :a, change
  end

  # given a decimal amount, returns an array
  # with coins for that amount
  def make_change(amount)
    amount = amount * 100

    dollars, amount = coins_per_amount(100, amount)
    quarters, amount = coins_per_amount(25, amount)
    dimes, amount = coins_per_amount(10, amount)
    nickels, amount = coins_per_amount(5, amount)

    coins_for_change(dollars, quarters, dimes, nickels)
  end

  def coins_for_change(dollars, quarters, dimes, nickels)
    change = []
    change << [:dollar] * dollars
    change << [:quarter] * quarters
    change << [:dime] * dimes
    change << [:nickel] * nickels
    change.flatten
  end

  def coins_per_amount(cents, amount)
    number_of_coins = (amount / cents).floor
    new_amount = amount % cents
    return number_of_coins, new_amount
  end

  def coin_amount
    @coins.reduce(0) do |total, coin|
      total += 0.05 if coin == :nickel
      total += 0.10 if coin == :dime
      total += 0.50 if coin == :quarter
      total += 1 if coin == :dollar
      total
    end
  end
end