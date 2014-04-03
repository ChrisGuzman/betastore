Customer.delete_all
CreditCard.delete_all
Order.delete_all
LineItem.delete_all

product_ids = Product.pluck(:id)
100.times do
  customer = Customer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email)
  customer.credit_cards.create!(
      card_number: Faker::Business.credit_card_number)

  (rand(5)+1).times do
    order = customer.orders.create!
    pids = product_ids.dup
    (rand(5)+1).times do
      # product_id = product_ids.sample
      # random_product = Product.find(random_product_id)
      # product_ids.delete(random_product_id)

      li = order.line_items.create!(product_id: pids.shuffle!.pop,
                                    quantity: (rand(5)+1)
                                    )
      # puts li.inspect


    # order.calculate_total_amount
    # order.save!
    end



  end



end
