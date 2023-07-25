class WelcomeController < ApplicationController
  skip_before_action :authenticate
  def index
    @events = Event.page(params[:page]).per(10)
  end
end
