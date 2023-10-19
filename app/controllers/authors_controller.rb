class AuthorsController < ApplicationController

  before_action :set_author, only: [:edit, :update, :show, :destory]

  def index
    @authors = Author.page(params[:page]).per(5).order("created_at DESC")
  end
  def show     
  end
  def new     
  end
  def create 
    @author = Author.new(author_params)
    # render plain: @book.inspect
    if @author.save 
      flash[:notice] = "Book was created successfully"
      redirect_to new_book_path
    else
      render 'new'
    end
  end
  def edit 

  end

  private 

  def set_author
    @book = Author.find(params[:id])
  end
  
  def author_params
    params.require(:author).permit(:name)
  end
end
