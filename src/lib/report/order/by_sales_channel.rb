module Report
    module Order
        module SalesChannelEnum
            REPRESENTATIVE = 1
            WEBSITE = 2
            ANDROID_APP = 3
            IPHONE_APP = 4
        end

        class BySalesChannel
            include SalesChannelEnum

            def initialize
                @by_sales_channel_lines = []
            end

            def build(orders)
                temp = {
                    :representative => 0,
                    :website => 0,
                    :android_app => 0,
                    :iphone_app => 0,
                }

                orders.each do |order|
                    case order.sales_channel
                    when REPRESENTATIVE
                        temp[:representative] += 1
                    when WEBSITE
                        temp[:website] += 1
                    when ANDROID_APP
                        temp[:android_app] += 1
                    when IPHONE_APP
                        temp[:iphone_app] += 1
                    end
                end

                @by_sales_channel_lines = temp
            end

            def self.call(orders)
                instance = new
                instance.build orders
                instance
            end

            def to_file
                { ok: true, value: @by_sales_channel_lines }
            end
        end
    end
end