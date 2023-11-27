class GoodsController < ApplicationController
    before_action :authenticate_user!

    def index

        if params[:search] == nil
            @goods= Good.all
          elsif params[:search] == ''
            @goods= Good.all
          else
            #部分検索
            @goods = Good.where("name LIKE ? ",'%' + params[:search] + '%')
        end
    end

def new
    @good = Good.new
end

def create
    good = Good.new(good_params)

    good.user_id = current_user.id

    if good.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
end

def destroy
    good = Good.find(params[:id])
    good.destroy
    redirect_to action: :index
  end

def show
    @good = Good.find(params[:id])

    @comments = @good.comments
    @comment = Comment.new

end

def edit
    @good = Good.find(params[:id])
  end

def update
    good = Good.find(params[:id])
    if good.update(good_params)
      redirect_to :action => "show", :id => good.id
    else
      redirect_to :action => "new"
    end
end

  private
  def good_params
    params.require(:good).permit(:name, :about, :image)
  end

end