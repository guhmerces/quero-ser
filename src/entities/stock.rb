#todo : make code decoupled relating to the distribution center name
module Entities
    class Stock
        attr_reader :products, :transfer_min
    
        def initialize(products)
            @products = products
            @transfer_min = 10
        end
    
        def self.call(products)
            new(products)
        end

        def should_transfer_min?(n)
            0 < n && n < @transfer_min
        end
    end
end

