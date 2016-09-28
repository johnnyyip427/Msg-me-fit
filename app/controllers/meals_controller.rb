class MealsController < ApplicationController

	def index
		@user = User.find(params[:user_id])
		@meal = Meal.all
	end

	def new
		@meal = Meal.new
	end

	def create
		@meal = Meal.new
		# (meal_params)
		# if @meal.save
		# 	redirect_to "/"
		# end
	end

	def show
		@meals = Meal.all
	end

	def send_text_message
		number_to_send_to = params[:number][:number_to_send_to]
		twilio_body = params[:number][:text_field]

		twilio_sid = ENV['TWILIO_ACCOUNT_SID']
		twilio_token = ENV['TWILIO_AUTH_TOKEN']
		twilio_phone_number = ENV['TWILIO_NUMBER']

		@twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

		@twilio_client.account.sms.messages.create(
			:from => twilio_phone_number,
			:to => number_to_send_to,
			:body => twilio_body
			)
	end

	private
  # def meal_params
  #   params.require(:meal).permit(:meal, :directions, :ingredients, :user_id)
  # end
end
