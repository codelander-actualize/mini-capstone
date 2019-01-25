json.id product.id
json.name product.name
json.price product.price
json.description product.description
json.image_url product.image_url
json.supplier_name product.supplier.name

json.formatted do
	json.discounted product.is_discounted?
	json.price number_to_currency(product.price)
	json.tax number_to_currency(product.tax)
	json.total number_to_currency(product.total)
end