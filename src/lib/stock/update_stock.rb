module Stock
    module UpdateStock
        def update_stock(orders)

            updated_stock = self.class.()

            self.products.map do |product|
                product_orders = orders.find_all do |order|
                    order.product.cod === product.cod
                end

                product_orders.each do |order|
                    product.reserve(**{amount: order.amount})
                end
            end
        end
    end
end