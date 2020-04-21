require_relative 'income'
require_relative 'methods.rb'
require 'colorize'

    class Essentials < MonthlyIncome

        attr_writer
        attr_accessor :essentials, :essentials_table, :total_after_essentials

        def initalize
            @essentials_total = 0
            super @income, add_spending
        end
        


        #resuable method for tabling items into format in each method
        def tabled_format(item, value) #DRY
            "#{item.capitalize}" + " "*(60 - item.length) + "$#{value}"
        end

        #prints suggested options for essentials
        def essentials_options            
            puts ["Mortgage", "Rent", "Insurance", "Bills", "Groceries", "Transport", "Medication"]
        end

        def total_after_essentials
            puts "\nYour remaining funds per month after essentials is: $#{@income - @essentials_total}"
        end

    end