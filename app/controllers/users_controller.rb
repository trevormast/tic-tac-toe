class UsersController < ApplicationController

  def index
    @users = User.all

    render inline: @users.map{ |user| "<p>#{ user.email }</p>" }.join('')
  end
end