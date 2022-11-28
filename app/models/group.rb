class Group < ApplicationRecord
    has_many :group_members, dependent: :destroy
    has_many :users, through: :group_users, dependent: :destroy

    def self.looks(search, word)
        if search == "perfect_match"
          @group = Group.where("name LIKE?","#{word}")
        elsif search == "forward_match"
          @group = Group.where("name LIKE?","#{word}%")
        elsif search == "backward_match"
          @group = Group.where("name LIKE?","%#{word}")
        elsif search == "partial_match"
          @group = Group.where("name LIKE?","%#{word}%")
        else
          @group = Group.all
        end
    end
end
