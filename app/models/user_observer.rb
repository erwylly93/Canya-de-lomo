class UserObserver < ActiveRecord::Observer
	observe :user
	def after_save(user)
		UserNotifier.forgot_password(user).deliver if user.password_forgotten?
	end
end
