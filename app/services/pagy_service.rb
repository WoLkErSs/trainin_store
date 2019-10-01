class PagyService
  include Pagy::Backend
  BOOKS_PER_PAGE = 12

  def call(category, filter)
    pagy(BooksQuery.new(category).books_sort(filter), items: BOOKS_PER_PAGE)
  end
end
