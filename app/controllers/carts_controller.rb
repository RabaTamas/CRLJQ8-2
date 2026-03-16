class CartsController < ApplicationController
  def show
    @items = cart_items
    @total = cart_total
    @shipping = @items.any? ? 990 : 0
  end

  def add
    session[:cart] ||= {}
    book_id = params[:book_id].to_s
    session[:cart][book_id] = (session[:cart][book_id] || 0) + 1
    flash[:notice] = 'A könyv hozzáadva a kosárhoz!'
    redirect_back fallback_location: cart_path
  end

  def remove
    session[:cart] ||= {}
    session[:cart].delete(params[:book_id].to_s)
    flash[:notice] = 'A könyv eltávolítva a kosárból.'
    redirect_to cart_path
  end

  def checkout
    @items = cart_items
    @total = cart_total
    @shipping = 990
    @order = Order.new
  end

  def place_order
    @items = cart_items
    return redirect_to(cart_path, alert: 'A kosár üres!') if @items.empty?

    @order = Order.new(order_params)
    @order.total = cart_total + 990

    if @order.save
      @items.each do |item|
        @order.order_items.create!(
          book: item[:book],
          quantity: item[:quantity],
          unit_price: item[:book].price
        )
      end
      session[:cart] = {}
      flash[:notice] = 'Rendelése sikeresen leadva! Köszönjük a vásárlást.'
      redirect_to root_path
    else
      render :checkout, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :phone)
  end
end
