class ProductsController < ApplicationController
def new
@product = Product.new
#redirect_to root_path
end
def create
@product = Product.new(products_params)
if @product.save
redirect_to root_path
end
end
def show
@product = Product.friendly.find(params[:id])
end
def addtocart
@skip = false
@products = []
@productId = params[:id]
@currentCart = cookies[:products]
if @currentCart.present?
@products = ActiveSupport::JSON.decode(@currentCart)
if !@products.blank?
for item in @products
if !item.blank?
if item['product'].to_i == @productId.to_i
item['quantity'] = item['quantity'] + 1
cookies[:products] = {:value => ActiveSupport::JSON.encode(@products.compact)}
@skip = true
break;
end
end
end
else
@products = []
end
if @skip == false
@products[@productId.to_i] = { 'product' => @productId.to_i, 'quantity' => 1 } 
cookies[:products] = {:value => ActiveSupport::JSON.encode(@products.compact)}
end
else
if @skip == false
@products[@productId.to_i] = { 'product' => @productId.to_i, 'quantity' => 1 }
cookies[:products] = {:value => ActiveSupport::JSON.encode(@products.compact)}
end
end
redirect_to cart_products_path
end
def cart
@currentCart = cookies[:products]
if @currentCart.present?
@products = ActiveSupport::JSON.decode(@currentCart)
@productIds = []
@productQuantity = []
@products = @products.compact
for item in @products
if !item.blank?
@productQuantity[item['product'].to_i] =  item['quantity'].to_i
@productIds << item['product'].to_i
end
end
@cartProducts = Product.all.where(:id => @productIds)
else
@cartProducts = []
end
end
def removeproduct
@productId = params[:id]
@currentCart = cookies[:products]
if @currentCart.present?
cookies.delete :products
@products = ActiveSupport::JSON.decode(@currentCart)
@products = @products.compact
@newproducts = []
for item in @products
if @productId.to_i != item['product'].to_i
	@newproducts[item['product'].to_i] = { 'product' => item['product'].to_i, 'quantity' => item['quantity'].to_i } 
end	
end
cookies[:products] = {:value => ActiveSupport::JSON.encode(@newproducts)}
end
redirect_to cart_products_path
end
def changeproducts
@productId = params[:id]
@qty = params[:qty]
@currentCart = cookies[:products]
@newproducts = []
if @currentCart.present?
cookies.delete :products
@products = ActiveSupport::JSON.decode(@currentCart)
@products = @products.compact
if !@products.blank?
for item in @products
if item['product'].to_i == @productId.to_i
	@newproducts[item['product'].to_i] = { 'product' => item['product'].to_i, 'quantity' => @qty.to_i }
	else
	@newproducts[item['product'].to_i] = { 'product' => item['product'].to_i, 'quantity' => item['quantity'].to_i }	
end	
end
end
cookies[:products] = {:value => ActiveSupport::JSON.encode(@newproducts)}
end
redirect_to cart_products_path
end
private
def products_params
params.require(:product).permit(:title,:description,:price,:image => 'winter.jpg')
end
end