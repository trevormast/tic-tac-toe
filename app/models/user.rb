class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def x_user?(game)
    game.x_user == self
  end

  def o_user?(game)
    game.o_user == self
  end

  def games
    Game.where(x_user: self).or(Game.where(o_user: self))
  end
end
