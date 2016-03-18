require 'frame'

class Bowling
  def self.score(frames)
    return 0 if frames.nil?
    score = 0
    score += frame_score(frames[0])
    (2..10).each do | frame_idx |
      current_frame = Frame.new(frames[frame_idx-1])
      last_frame = Frame.new(frames[frame_idx-2])
      score += current_frame.score
      score += current_frame.first_throw if last_frame.spare?
    end
    score
  end
end