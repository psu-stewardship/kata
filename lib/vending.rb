class Vending
  attr_reader :coins

  def initialize()
    @coins = []
    @currency = {dollar: 100, quarter: 25, dime: 10, nickel: 5}
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
    if current_amount < 0.65
      return nil, coin_return
    end

    new_amount = current_amount - 0.65
    change = make_change(new_amount)
    return :a, change
  end

  def get_b
    current_amount = coin_amount
    if current_amount < 1
      return nil, coin_return
    end

    new_amount = current_amount - 1
    change = make_change(new_amount)
    return :b, change
  end

  def get_c
    current_amount = coin_amount
    if current_amount < 1.50
      return nil, coin_return
    end

    new_amount = current_amount - 1.50
    change = make_change(new_amount)
    return :c, change
  end

  # given a decimal amount, returns an array
  # with coins for that amount
  def make_change(amount)
    amount = amount * 100

    change = []
    @currency.each do |key, value|
      num_coins, amount = coins_per_amount(value, amount)
      change << [key] * num_coins
    end
    change.flatten
  end

  def coins_per_amount(cents, amount)
    number_of_coins = (amount / cents).floor
    new_amount = amount % cents
    return number_of_coins, new_amount
  end

  def coin_amount
    @coins.reduce(0) do |total, coin|
      total += @currency[coin] / 100
    end
  end
end