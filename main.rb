require_relative 'account.rb'
require_relative 'essentials.rb'
require_relative 'methods.rb'
require_relative 'supplementary.rb'
require_relative 'goals.rb'
require 'date'
require 'tty-prompt'
require 'colorize'

  

  clear
  # butterfly_intro
  # header("Welcome to butterfly budgeting")
  # main_menu
  # clear

  print centered("Save budget as:").rstrip.light_magenta
  print " "
#This needs error handling/ a method to check
  user_name = gets.strip.capitalize
#Error Handling + Check for Int + Check for $
  print centered("Add monthly income:").rstrip.light_magenta
  print " $"
  user_income = gets.strip.to_i
  date = Date.today



  account = Account.new(user_name, user_income, date.strftime('%d-%m-%Y')) #adds the initialize variables to Account class; Creates the savings hash
  clear
  essentials = Essentials.new #creates the essentials hash
  essentials.essentials_header #Header for essentials
  account.user_details #Shows user details
  essentials.instructions #Prints instructions for adding essentials to the hash
  clear #Clear to begin main essentials loop
#create main essentials loop here.
  essentials.essentials_header #Header for essentials
  account.user_details #Shows user details
  essentials.add_essentials #Populates the essentials hash
  essentials.essentials_header #Header for essentials
  account.user_details #Shows user details
  essentials.sum_essentials #Adds total of essentials hash to total_essentials instance variable
  
  def total_after_essentials(total_income, total_essentials) #returns the total remaining funds after essentials
    remaining = total_income - total_essentials
      if remaining <= 0
        puts "\nOh no! You've already spent all your income!\nWould you like to edit your essentials?"
        #use yes no question here
        essentials.add_essentials #use method for edit essentials here
      else
        puts "\n"
        print centered("Your remaining funds per month after essentials is: $")
        print "#{remaining}\n\n".to_s.light_green
      end
  end

  total_after_essentials(account.income, essentials.essentials_total) #Tells the user their current funds
  account.spending_table(essentials.essentials_hash, essentials.essentials_total) #Tables data for user
  clear
  supplementary = Supplementary.new

  supplementary.supplementary_header
  account.user_details
  total_after_essentials(account.income, essentials.essentials_total) #Tells the user their current funds
  supplementary.instructions
  clear
  supplementary.supplementary_header
  account.user_details
  total_after_essentials(account.income, essentials.essentials_total) #Tells the user their current funds
  supplementary.add_supplementary
  clear
  supplementary.supplementary_header
  account.user_details
  supplementary.sum_supplementary
  account.calculate_savings(account.income, essentials.essentials_total, supplementary.supplementary_total)  #calculates balance after essentials and supplementary
  account.display_savings
  account.spending_table(supplementary.supplementary, supplementary.supplementary_total)
  clear

  goals = Goals.new
  goals.goals_header
  account.user_details
  goals.instructions
  clear
  goals.goals_header
  account.user_details
  account.display_savings
  goals.add_goals
  clear
  goals.goals_header
  account.user_details
  account.display_savings
  goals.goal_term(account.savings, goals.goals)


    clear
    account.user_details
    essentials.essentials_header #Header for essentials
    account.spending_table(essentials.essentials_hash, essentials.essentials_total) #Tables data for user
    supplementary.supplementary_header
    account.user_details
    total_after_essentials(account.income, essentials.essentials_total) #Tells the user their current funds
    account.spending_table(supplementary.supplementary, supplementary.supplementary_total)
    goals.goals_header
    account.display_savings
    goals.goal_term(account.savings, goals.goals)
