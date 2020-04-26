require_relative 'methods.rb'
require 'tty-prompt'

class Goals
    attr_accessor :goals, :goal_term

    def initialize
        @goals = Hash.new(0)
    end

    def goals_header
        puts header("savings and goals").light_green
    end

    def instructions
        puts "Here we consider things down the track we want to put our monthly savings towards"
        puts "This may include a larger purchase or a debt you're looking to pay off"
        puts "Add an item, followed by the total cost, then the term (in months)"
        return self
    end

    def add_goals
        puts centered("Add a goal, followed by the percentage of your savings you'd like to put towards it.").light_black
        prompt = TTY::Prompt.new
        @goals = prompt.collect do
            print "Goal: "
            key(gets.chomp.to_sym).values do
                key(:cost).ask('Cost: ', convert: :int)
                key(:percentage).ask('Percentage: ', convert: :int)
            while prompt.yes?("'Would you like to add anything else?'")
                print "Goal: "
                key(gets.chomp.to_sym).values do
                    key(:cost).ask('Cost: ', convert: :int)
                    key(:percentage).ask('Percentage: ', convert: :int)
                end
            end
        end
    end

    def goal_term(savings, hash)
        term = hash.map do |goal, array| 
        print (centered"Using #{(array[0][:percentage])}% of your savings it will take you " + 
        "#{array[0][:cost] / (savings * (array[0][:percentage].to_f / 100)).to_i}").rstrip
        array[0][:cost] / (savings * (array[0][:percentage].to_f / 100)).to_i == 1 ? (print "month to save for #{goal.capitalize}.") : (print "months to save for #{goal.capitalize}.")
        end
    end
end
end
# def goal_term(savings, hash)
#     term = hash.map do |goal, array| 
#     puts "Using #{(array[0][:percentage])}% of your savings #{goal.capitalize} will take " + 
#     "#{array[0][:cost] / (savings * (array[0][:percentage].to_f / 100)).to_i} months to save"
#     end
# end

# @goals = {goal: [{percentage: 25, cost: 3000}], other_goal: [{percentage: 25, cost: 3000}]}
# goal_term(500, @goals)


    # def add_goal(hash, options)
    #     puts `clear`
    #     puts centered("Add an item, type [options] for some suggestions, or press [enter] to continue.")
    #     print "Item: "
    #     add_item = gets.chomp
    #       if add_item == ""
    #         puts `clear`
    #       elsif add_item == "options"
    #         options.each{ |x| print "#{x}  ".cyan}
    #         print "\n"
    #         add_goal(hash, options)
    #       else
    #         print "Spending: "
    #         add_value = gets.chomp
    #         print "Term (in months): "
    #         term = gets.chomp
    #         hash[add_item] = [term.to_i, add_value.to_i]
    #         puts `clear`
    #         add_goal(hash, options)
    #     end
    # end