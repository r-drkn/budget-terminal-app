require_relative 'account.rb'
require_relative 'essentials.rb'
require_relative 'methods.rb'
require_relative 'supplementary.rb'
require_relative 'goals.rb'
require 'date'


  

  puts `clear`
  header("Welcome to butterfly budgeting")
  main_menu

#Error Handling + Check for Int + Check for $
  account = Account.new
  print "What is your name?  "
  @name = gets.strip
  print "What is your monthly income? (or 4 weeks of take home pay)  $"
  #This needs error handling/ a method to check
  @income = gets.strip.to_i

  essentials = Essentials.new
  essentials.add_essentials
  essentials.total_after_essentials(essentials.essentials_total)
  essentials.spending_table(essentials.essentials, essentials.essentials_total)


  supplementary = Supplementary.new
  supplementary.add_supplementary
  supplementary.spending_table(supplementary.supplementary, supplementary.supplementary_total)

  goals = Goals.new
  goals.add_goals(goals.goals)


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