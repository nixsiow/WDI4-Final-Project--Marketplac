class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def calc_total_price
    session[:cart].map do |order_product|
      orderProduct = OrderProduct.find order_product
      orderProduct.quantity * orderProduct.product.price
    end.inject(:+)
  end

  def initialize_new_cart
    session[:cart] = []
    session[:order_id] = nil
  end

  #-----------------------------------------
  #Devise: Adds additional permitted params to the devise user model
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password,
      :password_confirmation, :current_password) }
  end
  #-----------------------------------------
end
