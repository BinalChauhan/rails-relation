module OrdersHelper
    def product_image(order)
        if order.product.image.present?
           order.product.image
        else
            order.product.image
        end
    rescue
        orders_path
    end

    def product_name(order)
        if order.product.name.present?
            order.product.name
        else
            order.product.name
        end
    rescue
        orders_path
    end

    def product_price(order)
        if order.product.price.present?
            order.product.price
        else
            order.product.price
        end
    rescue
        orders_path
    end

    def product_description(order)
        if order.product.description.present?
            order.product.description
        else
            order.product.description
        end
    rescue
        orders_path
    end

end
