module Entities
    class Order
        attr_reader :product, :amount, :status, :sales_channel
    
        def initialize(products, amount, status, sales_channel)
            @product = product
            @amount = amount
            @status = status
            @sales_channel = sales_channel 
        end
    
        def self.build(product:, amount:, status:, sales_channel:)
            new(product, amount, status, sales_channel)
        end
            
    
        def self.call(**args)
            build(**args)
        end
    end
end
