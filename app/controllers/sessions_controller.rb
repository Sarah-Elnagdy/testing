class SessionsController < ApplicationController


	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
		flash[:error] = "Invalid email/password combination"
		redirect_to :back
	end
	end

	def destroy
		redirect_to root_path

	end

end
