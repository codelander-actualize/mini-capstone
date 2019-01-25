class Supplier < ApplicationRecord

	def products
		Product.where(supplier_id: id) #array of products - hashes
	end

end
