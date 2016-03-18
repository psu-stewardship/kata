class Bowling
  def self.score(scores)
    return 0 if scores.nil?

    scores.flatten.reduce(:+)
  end
end