class Product < ActiveRecord::Base
extend FriendlyId
  friendly_id :product_slug, use: :slugged
   def product_slug
    [
      :title,
      :id   
    ]
  end
end
