require_relative 'account.rb'
#This class is designed to hold all of the reusable methods used across classes to keep the code clean and DRY
class Methods < Account

    attr_accessor :add_spending, :spending_table, :essentials

    #method for adding items to user essentials hash
    #error handling: int check, 
    def add_spending(hash, options)
        print "\n\tItem:        "
        add_item = gets.chomp
        if add_item == ""
        elsif add_item == "options"
            puts options
            add_spending(hash, options)
        else
            print "\tSpending:    "
            add_value = gets.chomp
            hash[add_item] = add_value.to_i
            puts "\t\tAdd another item or press enter to continue."  
            add_spending(hash, options)
        end
    end

    #resuable method for tabling items into format in each method
    def tabled_format(item, value) #DRY
        "#{item.capitalize}" + " "*(75 - item.length) + "$#{value}"
    end

    #prints costs list in tabled format with total
    def spending_table(hash, total)
        puts "".center(80, "_")
      hash.each{ |item, value| puts tabled_format(item, value) }
        puts "".center(80, "_")
      total = hash.values.inject(:+)
        puts tabled_format("Total", total)
    end

    def instruct_bar
        puts "".center(80, "_").cyan
        options = "[options]: suggestions || [enter]: continue || [exit]: program"
        puts options.center(80, " ").underline.cyan
        return self
    end


end
