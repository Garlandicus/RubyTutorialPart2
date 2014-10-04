class SessionsController < ApplicationController
	#before_action :not_signed_in_user, only: [:new, :create]

	def new
	end

	def create
		#user = User.find_by(email: params[:session][:email].downcase)
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			flash[:welcome] = 'Welcome back! We\'re glad to see you again!'
			sign_in user
			redirect_back_or user
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

	private

#		def not_signed_in_user 
#			unless signed_in? ==  false
#	    		redirect_to root_url, notice: "You already did that!"
#	    	end
#	    end
end
