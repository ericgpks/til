class EventsController < ApplicationController
  skip_before_action :authenticate, only: :show
  attr_accessor :remove_image
  before_save :remove_image_if_user_accept

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "作成しました"
    end
  end

  def show
    @event = Event.find(params[:id])
    @tickets = @event.tickets.includes(:user).order(:created_at)
    @ticket = current_user && current_user.tickets.find_by(event: @event)
  end

  def edit
    @event = current_user.created_events.find(params[:id])
  end

  def update
    @event = current_user.created_events.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "更新しました"
    end
  end

  def destroy
    @event = current_user.created_events.find(params[:id])
    @event.destroy!
    redirect_to root_path, notice: "削除しました"
  end

  private

  def event_params
    params.require(:event).permit(:name, :place, :image, :remove_image, :content, :start_at, :end_at)
  end

  def remove_image_if_user_accept
    self.image = nil if ActiveRecord::Type::Boolean.new.cast(remove_image)

  end
end
