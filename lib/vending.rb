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

  def get_a
    return nil, coin_return
  end
end