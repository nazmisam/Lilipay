class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def invitation_email
    @escrow = params[:escrow]
    @url  = 'http://example.com/login'

    mail(to: @escrow.vendor_email, subject: 'Invitation for escrow')
  end
end