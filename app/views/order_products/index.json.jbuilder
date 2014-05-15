json.array!(@order_products) do |order_product|
  json.extract! order_product, :id
  json.url order_product_url(order_product, format: :json)
end
