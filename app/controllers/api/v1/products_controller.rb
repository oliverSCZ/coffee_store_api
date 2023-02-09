class Api::V1::ProductsController < ApplicationController

#/products
def index
	@productos = Product.all
	render json: @productos
end
#/products/1
def show
	@producto = Product.find(params[:id])
	render json: @producto.to_json(only: [:nombre, :descripcion, :existencia, :precio, :image_url, :category_id])
end

def create
	@producto = Product.create(product_params)
	if @producto.valid?
		render json: @producto, status: :created
	else
		render json: { errors: @producto.errors.full_messages },
		status: :not_acceptable
	end
end


private

def product_params
	params.permit(:nombre, :descripcion, :existencia, :precio, :image_url, :category_id)
end

end
