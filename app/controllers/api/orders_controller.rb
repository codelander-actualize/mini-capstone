class Api::OrdersController < ApplicationController

	before_action :authenticate_user

	def index
		@orders = current_user.orders
		render 'index.json.jbuilder'
	end

	def create
		carted_products = current_user.carted_products.where(status: "carted")

		@order = Order.new(
			user_id: current_user.id
		)

		if @order.save
			carted_products.update_all(status: "purchased", order_id: @order.id)
			@order.update_totals
			render 'show.json.jbuilder'
		else
			render json: {errors: @order.errors.full_messages}, status: 422
		end
	end

	def show
		@order = Order.find(params[:id])
		render 'show.json.jbuilder'
	end

end
