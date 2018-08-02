class BooksController < ApplicationController
  before_action :load_book, only: :show

  def show
    @related_books = Book.related_books @book.category_id, @book.id
  end

  private

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t "books.not_found_book"
    redirect_to root_path
  end
end
