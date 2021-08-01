# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create(
  email: 'test@gmail.com',
  password: 'hogehoge'
)

9.times do |n|
  Customer.create(
    first_name: "#{Gimei.last.kanji}",
    last_name: "#{Gimei.first.kanji}",
    first_name_kana: "#{Gimei.last.katakana}",
    last_name_kana: "#{Gimei.first.katakana}",
    postal_code: "1234567",
    address: "東京都豊島区#{n}",
    phone_number: "0801234567#{n}",
    email: "user#{n}@test.com",
    password: "testtest"
    )
end

Customer.all.each do |customer|
  rand(0..3).times do |n|
    Address.create(
      customer_id: customer.id,
      name: "#{customer.last_name}#{customer.first_name}の住所#{n}",
      address: "東京都板橋区下板橋-#{n}",
      postal_code: "1234567"
    )
  end
end

5.times do |n|
  Genre.create(
    name: "ジャンル#{n}"
  )
end

Genre.all.each do |genre|
  rand(0..6).times do |n|
    Item.create(
      genre_id: genre.id,
      name: "テスト商品#{genre.id}-#{n}",
      introduction: "テスト商品#{genre.id}-#{n}の説明",
      price: 100*rand(1..20),
      image: File.open("app/assets/images/img/cake.jpg")
    )
  end
end


Customer.all.each do |customer|
  rand(0..3).times do
    items = Item.all.sample(rand(1..10))
    order_price = 0
    order_items = []
    items.each do |item|
      order_item = OrderItem.new(
        item_id: item.id,
        amount: rand(1..5),
        total_price: (item.price * 1.1).floor
      )
      order_price += order_item.amount * order_item.total_price
      order_items.push(order_item)
    end

    order_price += 800

    order = Order.create!(
      customer_id: customer.id,
      price: order_price,
      payment_method: rand(0..1),
      name: customer.last_name + customer.first_name,
      address: customer.address,
      postal_code: customer.postal_code
    )

    order_items.each do |order_item|
      order_item.order_id = order.id
      order_item.save
    end
  end
end