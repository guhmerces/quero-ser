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
    end    
end