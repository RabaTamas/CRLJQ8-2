class BooksController < ApplicationController
  def index
    @categories = Category.all
    @books = Book.all

    @books = @books.search(params[:q])                          if params[:q].present?
    @books = @books.by_category(params[:category_id])          if params[:category_id].present?
    @books = @books.price_range(params[:price_min], params[:price_max]) if params[:price_min].present? || params[:price_max].present?

    @books = case params[:sort]
             when 'price_asc'  then @books.order(price: :asc)
             when 'price_desc' then @books.order(price: :desc)
             when 'newest'     then @books.order(created_at: :desc)
             else                   @books.order(:title)
             end

    @featured_books = Book.featured.limit(4)
  end

  def show
    @book = Book.includes(:category).find(params[:id])
    @related_books = Book.where(category: @book.category)
                         .where.not(id: @book.id)
                         .limit(4)
  end
end
