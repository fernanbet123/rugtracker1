class UsersController < ApplicationController
	#before_action :set_request, only: [:show, :edit, :update, :destroy]	
 	autocomplete :user, :phoneNum, :full => true

	def new
	end
	def show

		@user = User.find(params[:id])
		if @user
			@user
		else
			redirect_to new_user_path
		end
		@counter = 0
		@array = Product.first
		if @array
		@quantity =  @array[:quantity]
		end

	end
	
	def createmulti
		@user = User.find(params[:user_id])
		@item = @user.items.create(item_params)
		redirect_to user_path(@user)
		Product.delete_all

	end
	def index
		
		@user = User.search(params[:search])
		if params[:phoneNum]
      @user = User.name_like("%#{params[:phoneNum]}%").order('phoneNum')
      	end 
      	User.order(:firstName)
	end
	def edit
		@user = User.find(params[:id])
	end

	def create
		#render plain: params[:user].inspect
		@user = User.new(users_params)
		if	@user.save
			redirect_to @user
		else
			render 'new'
		end
	end
	def updateItem
		status = params[:status]
		@user = User.find(params[:user_id])
		@item = @user.items.find(params[:id])
		if @item.update(item_params)
			redect_to :action => 'show', :id => @item.id
		else
			render @user
		end
		
		
	end
	def update
		@user = User.find(params[:id])

		if @user.update(users_params)
			redirect_to users_path
		else
			render 'edit'
		end
		
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path
	end
	def createMulti
		@user = User.find(params[:user_id])
		@item = @user.items.create(item_params)
		redirect_to user_path(@user)
		Product.delete_all
	end
	private
	def users_params
		params.require(:user).permit(:firstName, :lastName, :phoneNum, :address, :city, :state, :zipCode, :email, :created_at)
	end
end

