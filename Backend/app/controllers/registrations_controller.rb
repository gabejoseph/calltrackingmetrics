class RegistrationsController < ApplicationController

    def create 
        binding.pry
        user = User.create(
            name: params[:name],
            email: params[:email],
            password: params[:password],
            username: params[:username], 
            phone: params[:phone]
        )

        if user 
            session[:user_id] = user.id
            render json: {
                status: :created, 
                user: user
            }
        else 
            render json: { status: 500 }
        end 
        
    end 

end