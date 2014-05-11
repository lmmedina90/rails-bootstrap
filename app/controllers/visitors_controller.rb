class VisitorsController < ApplicationController

	def new
		@visitor = Visitor.new
	end

	def create
		@visitor = Visitor.new(secure_params)
		if @visitor.valid?
			flash.now[:notice] = "Chose #{@visitor.favorite}."
			render :new
		end
			render :new
	end

	private

	def secure_params
		params.require(:visitor).permit(:favorite, :comment)
	end
end