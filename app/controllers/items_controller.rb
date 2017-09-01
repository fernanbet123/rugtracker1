class ItemsController < ApplicationController
	#this is to create a new item and to store the information in the database
	def create
		@user = User.find(params[:user_id])
		@item = Item.create(item_params)
		Product.delete_all
	end

	#this is to save multiple tag numbers in the database
	def createmulti
		tag = params[:tag]
		numTag = Product.first[:quantity]
		status = params[:status]
		@user = User.find(params[:user_id])
		@item = @user.items.create('tag' => tag.join(' '), 'status' => status, 'tagNum' => numTag )
		redirect_to user_path(@user)
		Product.delete_all

	end
	#this is necessary to show the items
	def index
	end
	#this is the action to show the specific item
	def show
		Item.order(:newDate)
		@user = User.find(params[:user_id])
		@item = @user.items.find(params[:id])
		numTag = Item[:tag].count

		
	end

	#action to 
	def edit
		@user = User.find(params[:user_id])
		@item = @user.items.find(params[:id])
	end
	def update
		newDate = params[:newDate]
		status = params[:status]
		@user = User.find(params[:user_id])
		@item = @user.items.find(params[:id])
		if @item.update('status' => status, 'newDate' => newDate)
			redirect_to user_path(@user) #:action => 'show', :id => @item.id
		else
			render @user
		end
		
	end
	# def updateItem
	# 	status = params[:status]
	# 	@user = User.find(params[:user_id])
	# 	@item = @user.items.find(params[:id])
	# 	if @item.update(item_params)
	# 		redect_to :action => 'show', :id => @item.id
	# 	else
	# 		render @user
	# 	end
		
		
	# end
	 def destroy
    	@user = User.find(params[:user_id])
    	@item = @user.items.find(params[:id])
    	@item.destroy
    	redirect_to @user
  	end
	def index
		@item = Item.search(params[:search])
	end
	private
		
	def item_params
      params.require(:item).permit(:tag, :status, :quantity, :newDate)
    end
end
