require_relative 'account'
require_relative 'methods.rb'
require 'colorize'
require 'tty-box'
require 'tty-prompt'

    class Essentials

        attr_reader :instructions, :income
        attr_accessor :essentials_hash, :sum_essentials, :essentials_total

        def initalize
            instructions
            @essentials_hash = Hash.new(0)
            @essentials_total = 0
        end
        
        def sum_essentials
            @essentials_total = @essentials_hash.values.inject(:+)
            return @essentials_total    
        end

        def add_essentials
            puts `clear`
            puts centered("Add a cost or press [enter] to skip\n")
            prompt = TTY::Prompt.new
            @essentials_hash = prompt.collect do  
                key(:rent).ask('Rent:', validate: /^[0-9]*$/)
                key(:groceries).ask('Groceries: ', validate: /^[0-9]*$/)
                key(:bills).ask('Bills: ', validate: /^[0-9]*$/)
                key(:phone).ask('Phone: ', validate: /^[0-9]*$/)
                key(:transport).ask('Transport: ', validate: /^[0-9]*$/)
                key(:medication).ask('Medication: ', validate: /^[0-9]*$/)
                key(:insurance).ask('Insurance: ', validate: /^[0-9]*$/)
                while prompt.yes?("'Would you like to add anything else?'") 
                    print "Item: "
                    key(begin #validation method to check item does not contain integers
                        validate_item(gets.chomp.downcase.to_sym)
                        rescue InvalidItemError=> e  
                        puts e.message 
                        print "Item: "
                        retry
                        end).ask('Cost: ', validate: /^[0-9]*$/)
                    end
                
                end
            @essentials_hash.delete_if { |k, v| v == nil || v == 0 }
            @essentials_hash = @essentials_hash.transform_values(&:to_i)
        end
        
        def edit_essentials
            if @essentials_hash.keys.include?(item) == true
              
            else
                puts "That item has not beed added yet"
            end
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