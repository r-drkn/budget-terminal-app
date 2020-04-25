require_relative 'account.rb'
require_relative 'essentials.rb'
require_relative 'methods.rb'
require_relative 'supplementary.rb'
require_relative 'goals.rb'
require 'date'
require 'tty-prompt'

  

  clear
  header("Welcome to butterfly budgeting")
  main_menu
#Error Handling + Check for Int + Check for $

  
#Value must be provided (required: true)
  #prompt = TTY::Prompt.new

  user_name = gets.strip.capitalize
  #prompt.ask("What is your name?", required: true)
#This needs error handling/ a method to check
  user_income = gets.strip.to_i
  #prompt.ask("What is your monthly income? (or 4 weeks of pay after tax", convert: :int, required: true)
  
  account = Account.new(user_name, user_income) #adds the initialize variables to Account class; Creates the savings hash

  essentials = Essentials.new #creates the essentials hash
  
  #create main essentials loop here.
  essentials.add_essentials #populates the essentials hash

  essentials.sum_essentials #creates a total essentials instance variable
  
  def total_after_essentials(total_income, total_essentials) #returns the total remaining funds after essentials
    remaining = total_income - total_essentials
      if remaining <= 0
        puts "\nOh no! You've already spent all your income!\nWould you like to edit your essentials?"
        #use yes no question here
        essentials.add_essentials #use method for edit essentials here
      else
        puts "\nYour remaining funds per month after essentials is: $#{remaining}"
      end
  end

  total_after_essentials(account.income, essentials.essentials_total)

  account.spending_table(essentials.essentials_hash, essentials.essentials_total)

  supplementary = Supplementary.new
  supplementary.add_supplementary
  supplementary.spending_table(supplementary.supplementary, supplementary.supplementary_total)

  goals = Goals.new
  goals.add_goals(goals.goals)
  goals.goal_term(account.savings, goals.goals)


  # #creates a hash for essentials items and their values
  # #suggested options for essentials, potential to move into other classes
  # essentials = Essentials.new
  # essentials.instructions.add_spending(account.essentials, account.essentials_options, "Add Essential Spending".center(50),account.spending_bar)
  # essentials.spending_table(account.essentials, account.essentials_total)
  # account.total_after_essentials

  # supplementary = Supplementary.new
  # supplementary.instructions.add_spending(account.supplementary, account.supplementary_options, "Add Supplementary Spending".center(50), account.spending_bar)
  # supplementary.spending_table(account.supplementary, account.supplementary_total)
  # account.total_after_sup

  # goals = Goals.new
  # goals.instructions.add_goals(goals.goals_hash, goals.goals_options)