class RoomsController < ApplicationController
  def show
    cookies.signed[:user_id] = User.first.id
    @messages = Message.all
  end
end
