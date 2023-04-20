require_relative('../lib/init')
require_relative('../entities/init')

class Start
    include Entities
    extend ::Loader::Products
    extend ::Loader::Orders

    def self.call
        products = []
        orders = []
        
        stock = Stock.(products)
        temp_stock = Marshal.load(Marshal.dump(stock))

        stock.update_stock(orders)

        results = [
            Report::Stock::StockReplacement.(temp_stock, stock).to_file,
            Report::Order::BySalesChannel.(orders).to_file,
            Report::Order::Divergences.(orders).to_file
        ]

        results.each do |result|
            if not result[:ok]
                raise Exception.new(result[:error])
            end
        end
    end
end

Start.()

