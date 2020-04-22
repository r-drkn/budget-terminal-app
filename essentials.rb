require_relative 'account'
require_relative 'methods.rb'
require 'colorize'

    class Essentials < Methods

        attr_reader :instructions
        attr_accessor :essentials

        def initalize
            instructions
            super @income
        end
        
        #return self here allows the add_spending method to run
        def instructions
            puts "Now lets input your essential spending.\n\n"
            sleep(1)
            puts "Here you will add all those things that are essential for your day to day living."
            puts "To view some suggestions type options, or add an item of your own followed by the \namount you spend per month\n\n"
            return self
        end

        #prints suggested options for essentials
        # def essentials_options            
        #     puts ["Mortgage", "Rent", "Insurance", "Bills", "Groceries", "Transport", "Medication"]
        #     return self
        # end

        

    end