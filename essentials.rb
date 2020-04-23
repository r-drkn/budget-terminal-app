require_relative 'account'
require_relative 'methods.rb'
require 'colorize'
require 'tty-box'
require 'tty-prompt'

    class Essentials < Methods

        attr_reader :instructions
        attr_accessor :essentials

        def initalize
            instructions
            @essentials
            @essentials_total = 0
        end
        
        def add_essentials
            @essentials = {}
            puts `clear`
            puts centered("Add a cost or press enter to skip\n")
            prompt = TTY::Prompt.new
            @essentials = prompt.collect do
                key(:rent).ask('Rent:', convert: :int)
                key(:groceries).ask('Groceries: ', convert: :int)
                key(:bills).ask('Bills: ', convert: :int)
                key(:phone).ask('Phone: ', convert: :int)
                key(:transport).ask('Transport: ', convert: :int)
                while prompt.yes?("'Would you like to add anything else?'")
                    print "Item: "
                    key(gets.chomp.downcase.to_sym).ask('Cost: ', convert: :int)
                    end
                end
            @essentials.delete_if { |k, v| v == nil || v == 0 }
        end

        def essentials_total
            @essentials_total = @essentials.values.inject(:+)
            return @essentials_total
        end

        #return self here allows the add_spending method to run
        def instructions
            puts `clear`
            puts "Now lets input your essential spending.\n\n"
            puts "Here you will add all those things that are essential for your day to day living."
            puts "Add an item followed by the \namount you spend per month\n\n"
            prompt = TTY::Prompt.new
            prompt.keypress("Press enter to continue", keys: [:return])
            return self
        end

        #prints suggested options for essentials
        # def essentials_options            
        #     puts ["Mortgage", "Rent", "Insurance", "Bills", "Groceries", "Transport", "Medication"]
        #     return self
        # end

        

    end