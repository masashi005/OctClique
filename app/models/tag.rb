class Tag < ApplicationRecord
  def self.looks(search, word)
    if search == "perfect_match"
      @tag = Tag.where("tag LIKE?","#{word}")
    elsif search == "forward_match"
      @tag = Tag.where("tag LIKE?","#{word}%")
    elsif search == "backward_match"
      @tag = Tag.where("tag LIKE?","%#{word}")
    elsif search == "partial_match"
      @tag = Tag.where("tag LIKE?","%#{word}%")
    else
      @tag = Tag.all
    end
  end
end
