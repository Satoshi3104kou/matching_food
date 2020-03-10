class FoodsController < ApplicationController
  def index
    
  end


  def new
    @food = Food.new
    @parents = Genre.where(ancestry: nil)
  end

  def create
    # binding.pry
    @food = Food.new(food_params)
   
    if @food.save
    
      redirect_to foods_path #成功の場合
    else        
      flash[:alert] = "既に作成されています"
      redirect_to new_food_path #失敗の場合 
    end
  end

  def genre
    if params[:parent]
      @child = Genre.find(params[:parent]).children
    else
      @grandchild = Genre.find(params[:child]).children
    end
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  private
      def food_params
        params.require(:food).permit(:way, :motivation, :wards, :table, :people, :time ,:genre)
      end

end