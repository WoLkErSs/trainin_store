class BooksController < ApplicationController
  BOOKS_PER_PAGE = 6
  include Pagy::Backend
  before_action :selection, only: :index
  decorates_assigned :book

  def index
    @pagy, @books = pagy(BooksQuery.new(@category).books_sort(@current_filter), items: BOOKS_PER_PAGE)
  end

  def show
    @book = Book.friendly.find(params[:id])
  end

  private

  def selection
    @current_filter = FilterService.new.call(params[:selection])
    @category = params[:category]
  end
end
