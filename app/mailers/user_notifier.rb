# encoding: utf-8
class UserNotifier < ActionMailer::Base
	default from: 'canyadelomo.ine@gmail.com'

	def forgot_password(user)
		setup_email(user)
		@subject += "Restauración de contraseña"
		mail to: user.email, subject: @subject
	end

	protected
	def setup_email(user)
		@subject = "[CAÑA DE LOMO] "
		@sent_on = Time.now
		@user = user
		@content_type = "text/html"
	end
end