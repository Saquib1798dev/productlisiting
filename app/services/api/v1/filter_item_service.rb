module Api
  module V1
    module FilterItemService
      class << self
        def call(search)
          @item = Item.where("lower(name) LIKE :q or CAST(price AS TEXT) LIKE :q or lower(description) LIKE :q or CAST(availability AS TEXT) LIKE :q",q: "%#{search}%")
          @item
        end 
      end
    end 
  end 
end
