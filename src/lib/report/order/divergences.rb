module Report
    module Order
        class Divergences
            def initialize

            end

            def build(orders)
            end

            def self.call(orders)
                instance = new
                instance.build orders
                instance
            end

            def to_file
                { ok: true, value: 1 }
            end
        end
    end
end