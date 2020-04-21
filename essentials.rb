require_relative 'income'
require 'colorize'

    class Essentials < MonthlyIncome

        attr_writer :add_essential_item
        attr_accessor :essentials, :essentials_table, :total_after_essentials

        def initalize()
            @essentials_total = 0
            super @income
        end
        


        #resuable method for tabling items into format in each method
        def tabled_format(item, value) #DRY
            "#{item.capitalize}" + " "*(60 - item.length) + "$#{value}"
        end

        #prints essentials list in tabled format with total
        def essentials_table(hash)
              puts "".center(65, "_")
            hash.each{ |item, value| puts tabled_format(item, value) }
              puts "".center(65, "_")
            @essentials_total = hash.values.inject(:+)
              puts tabled_format("Total", @essentials_total)
        end

        #prints suggested options for essentials
        def essentials_options            
            puts ["Mortgage", "Rent", "Insurance", "Bills", "Groceries", "Transport", "Medication"]
        end

        #method for adding items to user essentials hash
        #error handling: int check, 
        def add_essential_item(hash)
            print "Item:  "
            add_item = gets.chomp
            if add_item == ""
                puts `clear`
            elsif add_item == "options"
                puts `clear`
                puts essentials_options
                add_essential_item(hash)
            else
                print "Cost:  "
                add_cost = gets.chomp
                hash[add_item.to_sym] = add_cost.to_i
                puts `clear`
                puts "Add another item or press enter to continue."  
                add_essential_item(hash)
            end
        end

        def total_after_essentials
            puts "\nYour remaining funds per month after essentials is: $#{@income - @essentials_total}"
        end

    end