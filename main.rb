require_relative 'account.rb'
require_relative 'essentials.rb'
require_relative 'methods.rb'
require_relative 'supplementary.rb'
require_relative 'goals.rb'
require 'date'
require 'tty-prompt'
require 'colorize'

  

  clear
  butterfly_intro
  header("Welcome to butterfly budgeting")
  main_menu


# puts String.colors

  print "Save budget as: ".light_magenta
#This needs error handling/ a method to check
  user_name = gets.chomp.capitalize
#Error Handling + Check for Int + Check for $
  print "Add monthly income: ".light_magenta
  user_income = gets.strip.to_i
  date = Date.today


  account = Account.new(user_name, user_income, date) #adds the initialize variables to Account class; Creates the savings hash

  account.user_details #Shows user details

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
  supplementary.sum_supplementary

  account.calculate_savings(account.income, essentials.essentials_total, supplementary.supplementary_total) #calculates balance after essentials and supplementary

  account.spending_table(supplementary.supplementary, supplementary.supplementary_total)

  goals = Goals.new
  goals.add_goals
  puts goals.goals
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