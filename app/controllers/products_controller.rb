class ProductsController < ApplicationController
	def create
		@user = User.find(params[:user_id])
		@product = @user.products.create(product_params)
		if @product.save
			redirect_to user_path(@user), notice: 'successful'
		else
			redirect_to user_path(@user), notice: 'must be a number'
			
			
		end
	end
	def index
		@product = Product.search(params[:search])
	end
	def destroy
    @user = User.find(params[:user_id])
    @user = @auser.products.find(params[:id])
    @product.destroy
    redirect_to article_path(@article)
  end
	private
		
	def product_params
      params.require(:product).permit(:quantity)
    end

end
