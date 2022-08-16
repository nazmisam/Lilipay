class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def invitation_email
    @escrow = params[:escrow]
    @url1  = "https://#{ENV["domain"]}/users/sign_up"
    @url2  = "https://#{ENV["domain"]}/users/sign_up"


    mail(to: @escrow.vendor_email, subject: 'Invitation for escrow')
  end
end