class SignupsController < ApplicationController

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private
    
    def signup_params
        params.permit(:time, :activity_id, :camper_id)
    end

end
