# To deliver this notification:
#
# EscrowNotification.with(post: @post).deliver_later(current_user)
# EscrowNotification.with(post: @post).deliver(current_user)

class EscrowNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @escrow = Escrow.find_by(params[:escrow_id])
    @user = User.find_by(params[:id])
    "#{@escrow.user_email} has invited you to make escrow transaction" 
  end
  #
  def url
    user_escrow_path(Escrow.find_by(params[:escrow_id]))
  end
end
