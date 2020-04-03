class DeliveryExpense < ActiveHash::Base
  self.data = [
      { id: 1, value: '送料込み(出品者負担)' },
      { id: 2, value: '着払い(購入者負担)' },
  ]

  def self.get_delivery_expense(delivery_expense_id)
    if delivery_expense_id == [""]
      (1..DeliveryExpense.all.length).to_a
    else
      delivery_expense_id
    end
  end
end