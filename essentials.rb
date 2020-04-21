require_relative 'income'
require_relative 'methods.rb'
require 'colorize'

    class Essentials < MonthlyIncome

        attr_reader :instructions, :essentials_options
        attr_accessor :essentials, :essentials_table, :total_after_essentials 

        def initalize
            @essentials_total = 0
            instructions
            super @income, add_spending
        end
        
        #return self here allows the add_spending method to run
        def instructions
            sleep(1)
            puts `clear`
            puts "Now lets input your essential spending.\n\n"
            sleep(1)
            puts "Here you will add all those things that are essential for your day to day living."
            puts "To view some suggestions type options, or add an item of your own followed by the amount you spend per month\n\n"
            return self
        end

        #prints suggested options for essentials
        # def essentials_options            
        #     puts ["Mortgage", "Rent", "Insurance", "Bills", "Groceries", "Transport", "Medication"]
        #     return self
        # end

        def total_after_essentials
            puts "\nYour remaining funds per month after essentials is: $#{@income - @essentials_total}"
        end

    end