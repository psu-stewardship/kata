class Frame
  attr_reader :first_throw, :second_throw, :final_throw

  def initialize(throws)
    @first_throw = throws[0]
    @second_throw = throws[1]
    @final_throw = throws[2] || 0
  end

  def score
    first_throw + second_throw + final_throw
  end

  def strike?
    first_throw == 10
  end

  def spare?
    return false if strike?
    (first_throw + second_throw) == 10
  end

end