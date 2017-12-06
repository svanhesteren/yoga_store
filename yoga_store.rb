
# start
@shopping_cart = []

@departments = [ :mats, :props, :clothes, :books ]

@products = {
  mats: [
    { reference_number: 1231, name: "Super Lite Mat", price: 10 },
    { reference_number: 1232, name: "Power Mat", price: 20 },
  ],
  props: [
    { reference_number: 1233, name: "Block", price: 30 },
    { reference_number: 1234, name: "Meditation cushion", price: 30 },
  ],
  clothes: [
    { reference_number: 1235, name: "The best T-shirt", price: 200 },
    { reference_number: 1236, name: "The cutest yoga pants", price: 300 },
  ],
  books: [
    { reference_number: 1237, name: "Bring Yoga To Life", price: 30 },
    { reference_number: 1238, name: "Light On Yoga", price: 10 },
  ]
}

def show_product(product)
  if product
    return "Ref. number: #{product[:reference_number]},  name: #{product[:name]},  price: #{product[:price]}"
  end
end

def show_cart_contents

  puts "Shopping cart contents:\n"
  for product in @shopping_cart
    puts "- #{show_product(product)}"
  end

end

def ask_continue
  puts "\nDo you want to continue? (Y/N)"
  input = gets.chomp.upcase
  if input == "Y"
    shop
  elsif input == "N"
    checkout
  end
end

def checkout
  puts "Thank you very much."
  puts "total amount spent: #{add_prices}"

end

def add_prices
  total = 0
  for product in @shopping_cart
    total += product[:price].to_i
  end
  return total

end


def shop
  puts "Welcome to our store!"
  puts "Our currents departments are: "
  puts
  @departments.each_with_index{ |department, index|
    puts "#{index+1}) #{department}"
  }
  puts
  puts "Select a department you wish to visit: "
  chosen_department_index = gets.to_i

  if chosen_department_index > 0 && chosen_department_index < 5

    chosen_department = @departments[chosen_department_index - 1]
    products_list = @products[chosen_department.to_sym]


    puts "Chosen department is: #{chosen_department}"
    puts
    puts "Our products in this department are: "

    products_list.each_with_index{ |product, index|
      puts "#{index+1}) #{show_product(product)}"
    }

    puts
    puts "Select a product you wish to buy: "
    chosen_product_index = gets.to_i

    if chosen_product_index > 0 && chosen_product_index < products_list.length+1
      chosen_product = products_list[chosen_product_index-1]

      puts "You are buying: #{show_product(chosen_product)}\n"

      @shopping_cart << chosen_product

      show_cart_contents

      ask_continue
    end

  end
end

shop
