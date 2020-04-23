require_relative 'methods.rb'
require 'tty-prompt'

class Goals < Methods
    attr_accessor :goals_hash, :goals_options

    def initialize
        @goals_hash = {}
        @goals_options = ["Car", "House Deposit", "Holiday"]
    end

    def instructions
        puts "Here we consider things down the track we want to put our savings towards from the rest of our undesignated funds"
        puts "Add an item, followed by the total cost, then the term (in months)"
        prompt = TTY::Prompt.new
        prompt.keypress("Press enter to continue", keys: [:return])
        return self
    end

    def add_goal(hash, options)
        puts `clear`
        puts centered("Add an item, type [options] for some suggestions, or press [enter] to continue.")
        print "Item: "
        add_item = gets.chomp
          if add_item == ""
            puts `clear`
          elsif add_item == "options"
            options.each{ |x| print "#{x}  ".cyan}
            print "\n"
            add_goal(hash, options)
          else
            print "Spending: "
            add_value = gets.chomp
            print "Term (in months): "
            term = gets.chomp
            hash[add_item] = [term.to_i, add_value.to_i]
            puts `clear`
            add_goal(hash, options)
        end
    end


end