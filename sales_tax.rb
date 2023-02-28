class Product
    attr_accessor :name , :price , :quantity , :is_imported , :is_exampt
    def initialize(name,price,quantity,is_imported,is_exampt)
        @name = name
        @price = price
        @quantity = quantity
        @is_imported = is_imported
        @is_exampt = is_exampt
    end
end

$products = []
n = gets.chomp.to_i
n.times do
    str = gets.chomp
    words = str.split
    is_exampt = (/chocolate|pill|book/ =~ str) != nil
    is_imported = words.include? "imported"
    product = Product.new(str[str.index(" ")...str.index(" at")] , words[-1].to_f, words[0].to_i, is_imported,is_exampt)
    $products.push(product) 
end

puts

def calculate(products)
    totall_price = 0
    totall_tax = 0
    for product in products
        tax = 0.0
        tax = 0.1 if !product.is_exampt
        tax += 0.5 if product.is_imported
        tax *= product.price * product.quantity
        product_t_price = tax + (product.price * product.quantity)
        totall_price += product_t_price
        totall_tax += tax
        puts "#{product.quantity} #{product.name} : #{product_t_price.round(2)}"
    end
    puts "Sales Tax : #{totall_tax.round(2)}"
    puts "Total : #{totall_price.round(2)}"
end

calculate($products)






