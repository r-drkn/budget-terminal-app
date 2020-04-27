require_relative '../methods.rb'
require 'tty-prompt'

class Goals
  attr_accessor :goals, :goal_term

  def initialize
    @goals = Hash.new(0)
  end

  def add_goals
    puts centered("Add a goal, followed by the percentage of your savings you'd like to put towards it.").light_black
    prompt = TTY::Prompt.new
    @goals = prompt.collect do
      while prompt.yes?("Add a goal?")
        print "Goal: "
        key(gets.chomp.to_sym).values do
          key(:cost).ask('Cost: ', convert: :int)
          key(:percentage).ask('Percentage: ', convert: :int)
      end
    end
  end

  def goal_term(savings, hash)
    term = hash.map do |goal, array| 
    puts "Using #{(array[0][:percentage])}% of your savings ($#{(savings * (array[0][:percentage].to_f / 100.to_f)).to_i.to_s.light_green} per month) it will take you #{(array[0][:cost].to_f / (savings * (array[0][:percentage].to_f / 100.to_f))).ceil} month(s) to save for '#{goal.capitalize.to_s.light_yellow}' ($#{array[0][:cost].to_s.light_green}).".center(80, " ").rstrip
    end
    prompt = TTY::Prompt.new
    prompt.keypress(centered("Press enter to continue").light_black, keys: [:return])
    end
  end

  def goals_header
    puts header("savings and goals").light_green
  end

  def instructions
    puts header("Here we consider things down the track we want to put our monthly savings towards")
    puts header("This may include a larger purchase or a debt you're looking to pay off")
    puts header("Add an item, followed by the total cost, then the term (in months)")
    return self
  end

end