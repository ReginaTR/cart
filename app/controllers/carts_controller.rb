class CartsController < ApplicationController
  def create
    @cart = Cart.new
    session[:cart_id] = @cart.id
    render json: { id: @cart.id }
  end

  def add_item
    cart = Cart.find(session[:cart_id])
    product = Product.find(params[:product_id])
    
    existing_item = cart.cart_items.find_by(product: product)
    
    if existing_item
      existing_item.update(quantity: existing_item.quantity + params[:quantity].to_i)
    else
      CartItem.create(cart: cart, product: product, quantity: params[:quantity].to_i)
    end
    
    render json: {
      id: cart.id,
      products: cart.products.map do |item|
        {
          id: item.product.id,
          name: item.product.name,
          quantity: item.quantity,
          unit_price: item.product.price,
          total_price: item.total_price
        }
      end
      }
  end

  def calculate_total(cart)
    cart.products.sum do |item|
      item.product.price * item.quantity
    end
  end

end
