require_relative 'account.rb'
require_relative 'essentials.rb'
require_relative 'methods.rb'
require_relative 'supplementary.rb'
require_relative 'goals.rb'
require 'date'


  

  methods = Methods.new
  puts `clear`
  methods.header("Welcome to butterfly budgeting")
  methods.main_menu

#Error Handling + Check for Int + Check for $
  account = Account.new
  print "What is your name?  "
  account.name = gets.strip
  print "What is your monthly income? (or 4 weeks of take home pay)  $"
  #This needs error handling/ a method to check
  account.income = gets.strip.to_i

essentials = Essentials.new
essentials.instructions.add_essentials(account.essentials)
essentials.spending_table(account.essentials, account.essentials_total)


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