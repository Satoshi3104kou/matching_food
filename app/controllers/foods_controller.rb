class FoodsController < ApplicationController
  def index
    @food = Food.all
    # @user = User.find(params[:id])
    @q = Food.ransack(params[:q])

    @foods =@q.result(distinct: true)
    # @food = Food.all
    @parents = Genre.where(ancestry: nil)

  end


  def new
    @food = Food.new
    @parents = Genre.where(ancestry: nil)
    @store_name = current_user.store_name
  end

  def create

    @food = Food.create(food_params)
    # binding.pry
    if @food.save
    
      redirect_to food_path(@food.id) #成功の場合
    else    

      flash[:alert] = "必須項目を埋めてください"
      redirect_to new_food_path #失敗の場合 
    end
  end

  def show
    @food = Food.find(params[:id])
    @genre = @food.genre
    @ground_child = Genre.find(@food.genre_id)
    @child = @ground_child.parent
    @parent = @child.parent
    @store_name = current_user.store_name
  end

  def edit
    @food = Food.find(params[:id])
    @parents = Genre.where(ancestry: nil)
    
    @ground_child = Genre.find(@food.genre_id)
    @child = @ground_child.parent
    @parent = @child.parent
    @store_name = current_user.store_name
    @genre_parent_array = []
    # categoriesテーブルから親カテゴリーのみを抽出、配列に格納
    Genre.where(ancestry: nil).each do |parent|
    @genre_parent_array << parent.name
    end

    # itemに紐づいていいる孫カテゴリーの親である子カテゴリが属している子カテゴリーの一覧を配列で取得
    @genre_child_array = @food.genre.parent.parent.children

    # itemに紐づいていいる孫カテゴリーが属している孫カテゴリーの一覧を配列で取得
    @genre_grandchild_array = @food.genre.parent.children
  end


  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to food_path
    else
      flash[:notice] = "必須項目を全て入力してください。"
      redirect_to edit_food_path 
    end
    # food = Food.find(params[:id])
    # food.update(food_params)
    # redirect_to root_path
  end
  

  def destroy
    food = Food.find(params[:id])
    food.destroy
    redirect_to root_path
    
  end

  def search
    # binding.pry
    @q = Food.ransack(search_params)
    # binding.pry
    @foods = @q.result(distinct: true)
    # binding.pry
    # @word = Word.search(params[:keyword]).first
    # food = Food.find(params[:id])
    # @parents = Genre.where(ancestry: nil)

    # @food = Food.search(params[:keyword])
    
    if @food
      redirect_to search_foods_path
    else          
      # flash[:alert] = "見当たりません。"
      # redirect_to root_path #失敗の場合 
      # redirect_to root_path(@foods)
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
        params.require(:food).permit(:way, :motivation, :wards, :table, :people, :time ,:genre_id,:service).merge(user_id: current_user.id)
      end
     
      def search_params
        # params.require(:q).permit!
        params.require(:q).permit(:way_eq, :motivation_eq, :wards_eq, :table_eq, :people_eq, :time_eq )
        # params.require(:q).permit(:way_eq)
      end

end