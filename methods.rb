class Methods

    attr_accessor :add_spending, :spending_table

    def initialize
    end


    #method for adding items to user essentials hash
    #error handling: int check, 
    def add_spending(hash)
        print "Item:  "
        add_item = gets.chomp
        if add_item == ""
            puts `clear`
        elsif add_item == "options"
            puts `clear`
            puts essentials_options
            add_spending(hash)
        else
            print "Spending:  "
            add_value = gets.chomp
            hash[add_item] = add_value.to_i
            puts `clear`
            puts "Add another item or press enter to continue."  
            add_spending(hash)
        end
    end

    #prints costs list in tabled format with total
    def spending_table(hash)
        puts "".center(65, "_")
      hash.each{ |item, value| puts tabled_format(item, value) }
        puts "".center(65, "_")
      total = hash.values.inject(:+)
        puts tabled_format("Total", total)  
    end

end
