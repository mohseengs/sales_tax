class Products
    private
        @@exempt = ["book", "chocolate bar", "headache pills", "box of chocolates", "packet of headache pills"]

    public
    def self.is_exempt(product_name)
        true if @@exempt.include? product_name
    end
end

class Tax < Products
    @@total_price = 0
    @@total_tax = 0

    def calculate(product)
        hash = product
        @tax = 0.1
        @tax += 0.05 if hash[:is_imported] == true
        if Products.is_exempt(hash[:name].strip) == true
            @tax = 0
        end
        @tax *= hash[:price] 
        product_total = @tax + hash[:price] 
        @@total_tax += @tax
        @@total_price += product_total
        return product_total
    end

end

class Main < Tax
    def initialize
       main
    end

    def main
        results = []
        puts "first line input N and next N line input queries"
        puts "-"*40
        n = gets.chop.to_i
        n.times do 
            hash = process_input()
            results.push "#{hash[:quantity]} #{hash[:name]} : #{calculate(hash).round(2)}"
        end
        puts "-"*40
        for result in results
            puts result
        end
        puts "total tax : #{@@total_tax.round(2)}"
        puts "total price : #{@@total_price.round(2)}"

    end
    
    def process_input
        hash = {}
        array = gets.chomp.split
        array.delete("at")
        hash[:quantity] = array[0].to_i 
        hash[:is_imported] = false
        hash[:is_imported] = true if array.include? "imported" 
        hash[:price] = array[-1].to_f
        array.delete("imported")
        hash[:name] = array[1...-1].join(" ")
        return hash
    end
end

main = Main.new
