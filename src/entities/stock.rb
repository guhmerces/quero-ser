#todo : make code decoupled relating to the distribution center name
module Entities
    class Stock
    
        def initialize(products)
            @products = products
        end
    
        def self.call(products)
            new(products)
        end
    end
end

