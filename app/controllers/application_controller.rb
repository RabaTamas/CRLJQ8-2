class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :cart_items, :cart_total

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      flash[:alert] = 'A folytatáshoz be kell jelentkezni.'
      redirect_to login_path
    end
  end

  # --- Kosár (session-based) ---
  def cart_items
    session[:cart] ||= {}
    book_ids = session[:cart].keys.map(&:to_i)
    books = Book.where(id: book_ids).index_by(&:id)
    session[:cart].map do |book_id, qty|
      book = books[book_id.to_i]
      next unless book
      { book: book, quantity: qty }
    end.compact
  end

  def cart_total
    cart_items.sum { |item| item[:book].price * item[:quantity] }
  end

  def cart_count
    (session[:cart] || {}).values.sum
  end
  helper_method :cart_count
end
