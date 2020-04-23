require_relative 'methods.rb'

class Goals < Methods
    attr_accessor :goals_hash, :options

    def initialize
        @goals_hash = {}
        @options = ["Car", "House Deposit", "Holiday"]
    end

    def add_goal(hash, options) 
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