class CartsController < ApplicationController
    before_action :set_cart, only: %i[ show edit ]

    def index
      product_ids = session['product_ids']
      @carts = Product.where(id: product_ids)
    end
  
    def show
    end
  
    def create
      product_id = params[:id]
      session["product_ids"] = [] unless session["product_ids"].present?
      if Product.exists?(product_id)
        session["product_ids"] << product_id 
        redirect_to cart_url(product_id), notice: "Product was added to cart successfully"
      else
        redirect_to products_url, notice: "This Product already into Cart please go to cart items"
      end
    end
  
  
    def destroy
      project_ids = session["product_ids"]
      session["product_ids"].delete_at(project_ids.index(params[:id]) || project_ids.length)

      respond_to do |format|
        format.html { redirect_to cart_url(params[:id]), notice: "Cart was successfully removed." }
      end
    end
  
    private
      def set_cart
        if session["product_ids"].include?(params[:id])
          @cart =Product.find(params[:id])
        else 
          @cart = Product.new
        end
      end
  
      def product_params
        params.require(:product).permit(:name, :description, :price)
      end
  end
  