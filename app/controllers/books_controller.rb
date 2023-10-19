class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :show, :destroy]
  def index
    @books = Book.page(params[:page]).per(5).order("created_at DESC")
  end

  def show    
  end
  def new   
     @book = Book.new
  end

  def create 
    @book = Book.new(book_params)
    # render plain: @book.inspect
    if @book.save 
      HelloJob.perform_later(@book)
      flash[:notice] = "Book was created successfully"
      redirect_to books_path
    else
      render 'new'
    end
  end
  def edit 

  end
  def update
    if @book.update(book_params)
      flash[:notice] = "Book was updated successfully."
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    # if @book.present?
    #     @book.destroy
    # end
    Book.destroy(params[:id])
    flash[:notice] = "Book was deleted"
    redirect_to books_path
  end
  

  private 

  def set_book 
    @book = Book.find(params[:id])
  end
  
  def book_params
    params.require(:book).permit(:judul, :tahun_terbit,:email, :author_id)
  end
end
