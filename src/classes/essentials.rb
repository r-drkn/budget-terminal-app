require_relative '../methods.rb'
require 'colorize'
require 'tty-prompt'

  class Essentials

    attr_reader :instructions
    attr_accessor :essentials_hash, :essentials_total

    def initalize
      @essentials_hash = Hash.new(0)
      @essentials_total = 0
    end

    def add_essentials
      puts header("Add a cost or press [enter] to skip").light_black
      prompt = TTY::Prompt.new
      @essentials_hash = prompt.collect do  
        key(:rent).ask('Rent: $', validate: /^[0-9]*$/)
        key(:groceries).ask('Groceries: $', validate: /^[0-9]*$/)
        key(:bills).ask('Bills: $', validate: /^[0-9]*$/)
        key(:phone).ask('Phone: $', validate: /^[0-9]*$/)
        key(:transport).ask('Transport: $', validate: /^[0-9]*$/)
        key(:medication).ask('Medication: $', validate: /^[0-9]*$/)
        key(:insurance).ask('Insurance: $', validate: /^[0-9]*$/)
        while prompt.yes?("'Would you like to add anything else?'") 
          print "Item: "
          key(begin #validation method to check item does not contain integers
            validate_item(gets.chomp.downcase.to_sym)
            rescue InvalidItemError=> e  
            puts e.message 
            print "Item: "
            retry
            end).ask('Cost: $ ', validate: /^[0-9]*$/)
          end
        end
      @essentials_hash.delete_if { |k, v| v == nil || v == 0 }
      @essentials_hash = @essentials_hash.transform_values(&:to_i)
      clear
    end

    def edit_essentials
      puts header("To edit a cost, type its name mnfollowed by the new price.").light_black
      puts header("To delete a cost, type its name and leave the cost blank.").light_black
      puts header("To add a new cost, type a title, followed by the price").light_black
      puts "\n"
      prompt = TTY::Prompt.new
      edited_hash = prompt.collect do
        while prompt.yes?(header('Would you like to add, edit or delete an item?').rstrip) 
          print "\nItem: "
          key(begin #validation method to check item does not contain integers
            validate_item(gets.chomp.downcase.to_sym)
            rescue InvalidItemError=> e  
            puts e.message 
            print "Item: "
            retry
            end).ask('Cost: $ ', validate: /^[0-9]*$/)
          end
        end
      @essentials_hash = @essentials_hash.merge!(edited_hash){|key, oldval, newval| oldval = newval}
      @essentials_hash.delete_if { |k, v| v == nil || v == 0 }
      @essentials_hash = @essentials_hash.transform_values(&:to_i)
      clear
    end
    
    def total_after_essentials(total_income, total_essentials) #returns the total remaining funds after essentials
      remaining = total_income - total_essentials
      # if remaining <= 0
      #   header("Oh no this can't be right... You've already spent all your income!")
      #   prompt = TTY::Prompt.new
      #   q = prompt.yes?(header('Would you like to edit your essentials?'))
      #   if q == true
      #   edit #use method for edit essentials here
      #   else
      #   clear
      #   end
      # else
        puts "\n"
        print centered("Your remaining funds per month after essentials is: $")
        print "#{remaining}\n\n".to_s.light_green
    end
    
    def sum_essentials
      @essentials_total = @essentials_hash.values.inject(:+)
      return @essentials_total    
    end

    def instructions
      puts "\n"
      puts centered("First we'll input your essential spending.\n")
      puts centered("Here you will add items that are essential for your day to day living.")
      puts centered("Add an item followed by the amount you spend per month.\n")
      return self
    end

    def essentials_header
      puts header("essential spending").light_green
    end
  end