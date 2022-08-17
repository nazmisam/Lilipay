class ApplicationController < ActionController::Base
  around_action :set_time_zone
  before_action :set_notifications, if: :current_user

  private

  def set_notifications
    notifications = Notification.where(recipient: current_user).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.unread
  end

  def set_time_zone
    Time.use_zone("Kuala Lumpur"){yield}
  end
end
