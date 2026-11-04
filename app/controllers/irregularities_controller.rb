class IrregularitiesController < ApplicationController

	def index
		@signal = Irregularity.new
	end
	
	def create
		@signal = Irregularity.new(signal_params)
		if verify_recaptcha(model: @signal) && @signal.save
		#if @signal.save
			ApplicationMailer.signal_mail(@signal).deliver_later
			redirect_to "/signals", notice: t('.success')
		else
			flash.now[:error] = t('.error')
			render '/irregularities/index'
		end
	end
	
	private
	
	def signal_params
		params.require(:irregularity).permit(:name, :email, :address, :message, :phone_number, :file, :tos)
	end
end
