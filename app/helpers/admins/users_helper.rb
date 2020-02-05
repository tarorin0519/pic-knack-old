module Admins::UsersHelper

	def curren_user?(User)
	  user == current_user
	end
end
