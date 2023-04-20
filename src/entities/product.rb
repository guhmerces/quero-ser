module Entities
    class Product
        attr_reader :cod, :qty, :min_qty
    
        def initialize(cod, qty, min_qty)
            @cod = cod
            @qty = qty
            @min_qty = min_qty
        end
    
        def self.call(cod:, qty:, min_qty:, **_)
            new(cod, qty, min_qty)
        end

        def reserve(amount:)
            @qty -= amount
        end

        def replacement?
            @min_qty > @qty
        end

        def replacement_amount
            if not replacement?
                return 0
            end
            @min_qty - @qty
        end
    end    
end