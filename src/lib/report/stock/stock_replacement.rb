module Report
    module Stock
        class StockReplacement
            def initialize
                @product_lines = []
            end

            def build(old_stock, new_stock)
                @product_lines = new_stock.products.map do |product|
                    old_product_data = old_stock.products.find do |old_product|
                        product.cod === old_product.cod
                    end

                    replacement_amount = product.replacement_amount
                    
                    {
                        product_cod: product.cod,
                        initial_amount: old_product_data.qty,
                        qt_min: product.min_qty,
                        sold_amount: (old_product_data.qty - product.qty),
                        stock_after_sells: product.qty,
                        replacement_amount: replacement_amount,
                        transfer_qty: new_stock.should_transfer_min?(replacement_amount) ?
                            new_stock.transfer_min :
                            replacement_amount
                    }
                end
            end

            def self.call old_stock, new_stock
                instance = new
                instance.build(old_stock, new_stock)
                instance
            end

            def to_file
                temp = @product_lines.map do |data|
                    {
                        "Produto" => data[:product_cod],
                        "QtCo" => data[:initial_amount],
                        "QtMin" => data[:qt_min],
                        "QtVendas" => data[:sold_amount],
                        "EstqAposVendas" => data[:stock_after_sells],
                        "Necess" => data[:replacement_amount],
                        "TransfDeArmpCO" => data[:transfer_qty],
                    }
                end
            end
        end
    end
end