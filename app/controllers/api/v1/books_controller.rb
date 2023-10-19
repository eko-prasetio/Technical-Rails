class Api::V1::BooksController < ApplicationController 
    def index
        per_page = params[:per_page] || 5
        page = params[:page] || 1 # Default 
        @books = Book.includes(:author).page(page).per(per_page)
        render json: @books, include: :author
      end
end