class CashRegister

    attr_accessor :total, :discount
    @@last_item_price = 0

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @@item = []

    end

    def add_item(title, price, quantity=1)
        self.total = self.total + quantity*price
        @@last_item_price = quantity*price
        while quantity > 0 do
            @@item.push(title)
            quantity = quantity - 1
        end
    end

    def apply_discount
        if discount != nil
            self.total = self.total - (self.discount*self.total/100.0)
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end

    end

    def items
        @@item
    end

    def void_last_transaction
        if @@item != nil
            self.total = self.total - @@last_item_price
            @@item.pop

        else
            self.total = 0
        end
    end


end