class NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(recipient: current_user).order(created_at: :desc)
    render json: @notifications
  end
end
