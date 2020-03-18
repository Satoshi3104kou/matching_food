class UsersController < ApplicationController

  
  def show
    # binding.pry
    # @food = Food.find(params[:id])
    # @food = Food.where(active: true)
    # @user = User.find(id: params[:food][:user_id])
    # binding.pry
    # @user = User.find(current_user.id)
    @foods = current_user.foods
    # @user = User.find(params[:id])
    # # binding.pry
    # # @foods = current_user.foods
    # @foods = @user.foods
    # binding.pry
    # @foods = Food.includes(:images).order('created_at DESC')
    # @genre = food.genre
    # @child = @ground_child.parent
    # @parent = @child.parent
  
    # @ground_child = Genre.find(@food.genre_id)
    @store_name = current_user.store_name
  end
  # private
  #     def food_params
  #       params.require(:food).permit(:way, :motivation, :wards, :table, :people, :time ,:genre_id,:service).merge(user_id: current_user.id)
  #     end


end
