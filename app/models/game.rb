require 'game_result'

class Game < ApplicationRecord
  belongs_to :x_user, class_name: 'User'
  belongs_to :o_user, class_name: 'User'

  def active_player
    grid.count(nil).odd? ? x_user : o_user
  end

  def results
    GameResult.new(self.grid)
  end
end