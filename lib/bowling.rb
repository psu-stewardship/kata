class Bowling
  def self.score(frames)
    return 0 if frames.nil?
    score = 0
    has_spare = false
    frames.each_with_index do |frame, index|
      score += frame_score(frame)
      score += 4 if has_spare
      has_spare = spare?(frame)
      score += frame[2] if index == 9 && has_spare
    end
    score
  end

  def self.spare?(frame)
    frame_score(frame) == 10
  end

  def self.frame_score(frame)
    frame[0]+frame[1]
  end

end