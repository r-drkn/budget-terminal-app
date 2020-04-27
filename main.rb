require 'colorize'
require 'date'
require 'tty-prompt'
require_relative './classes/account.rb'
require_relative './classes/essentials.rb'
require_relative './classes/supplementary.rb'
require_relative './classes/goals.rb'
require_relative 'methods.rb'

puts "Hello"
# allow passing name as an argument
# if name isn't passed in, prompt to ask for it
# ARGV.rb
# ruby ARGV.rb "Varsha"
name = (ARGV.length > 0) && ARGV
puts ARGV
if name == nil
    puts "What is your name?"
    name = gets.chomp
end
puts "Hi #{name}"
sleep(1)
clear



  # clear
  # butterfly_intro
  
  # clear

  puts header("Welcome to butterfly budgeting").cyan
  puts header("First we'll add some details").light_black
  puts "\n"
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
  prompt = TTY::Prompt.new
  prompt.keypress(centered("Press enter to continue").light_black, keys: [:return])
  clear #Clear to begin main essentials loop
  essentials.essentials_header #Header for essentials
  account.user_details #Shows user details
    essentials.add_essentials #Populates the essentials hash
    essentials.sum_essentials #Adds total of essentials hash to total_essentials instance variable
  essentials.essentials_header #Header for essentials
  account.user_details #Shows user details
    essentials.total_after_essentials(account.income, essentials.essentials_total) #Tells the user their current funds
    account.spending_table(essentials.essentials_hash, essentials.essentials_total) #Tables data for user
    prompt = TTY::Prompt.new
    prompt.keypress(centered("Press enter to continue").light_black, keys: [:return])
      if prompt.yes?(header('Would you like to edit your essentials?').rstrip) do |q|
        q.default false
      end
        clear
        essentials.essentials_header #Header for essentials
        account.user_details #Shows user details
        essentials.total_after_essentials(account.income, essentials.essentials_total) #Tells the user their current funds
        account.spending_table(essentials.essentials_hash, essentials.essentials_total) #Tables data for user    
          essentials.edit_essentials #Option to edit essentials hash
          essentials.essentials_header #Header for essentials
          account.user_details #Shows user details
          essentials.total_after_essentials(account.income, essentials.essentials_total) #Tells the user their current funds
          account.spending_table(essentials.essentials_hash, essentials.essentials_total) #Tables data for user
          prompt.keypress(centered("Press enter to continue").light_black, keys: [:return])  
          clear
      else
        clear
    end
#create main essentials loop here.

  


  
  supplementary = Supplementary.new

  supplementary.supplementary_header
  account.user_details
  essentials.total_after_essentials(account.income, essentials.essentials_total) #Tells the user their current funds
  supplementary.instructions
  prompt = TTY::Prompt.new
  prompt.keypress(centered("Press enter to continue").light_black, keys: [:return])
  clear
  supplementary.supplementary_header
  account.user_details
  essentials.total_after_essentials(account.income, essentials.essentials_total) #Tells the user their current funds
  supplementary.add_supplementary
  clear
  supplementary.supplementary_header
  account.user_details
  supplementary.sum_supplementary
  account.calculate_savings(account.income, essentials.essentials_total, supplementary.supplementary_total)  #calculates balance after essentials and supplementary
  account.display_savings
  account.spending_table(supplementary.supplementary, supplementary.supplementary_total)
  prompt = TTY::Prompt.new
  prompt.keypress(centered("Press enter to continue").light_black, keys: [:return])
    if prompt.yes?(header('Would you like to edit your essentials?').rstrip) do |q|
    q.default false
    end
      clear
      supplementary.supplementary_header
      account.user_details
      account.display_savings
      account.spending_table(supplementary.supplementary, supplementary.supplementary_total)
        supplementary.edit_supplementary
          supplementary.supplementary_header
          account.user_details
          account.display_savings
          account.spending_table(supplementary.supplementary, supplementary.supplementary_total)
          prompt = TTY::Prompt.new
          prompt.keypress(centered("Press enter to continue").light_black, keys: [:return])
          clear
    else 
      clear
    end   

  goals = Goals.new
  goals.goals_header
  account.user_details
  goals.instructions
  prompt = TTY::Prompt.new
  prompt.keypress(centered("Press enter to continue").light_black, keys: [:return])
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
  prompt = TTY::Prompt.new
  prompt.keypress(centered("Press enter to continue").light_black, keys: [:return])


  clear
  account.user_details
  essentials.essentials_header #Header for essentials
  account.spending_table(essentials.essentials_hash, essentials.essentials_total) #Tables data for user
  supplementary.supplementary_header
  essentials.total_after_essentials(account.income, essentials.essentials_total) #Tells the user their current funds
  account.spending_table(supplementary.supplementary, supplementary.supplementary_total)
  goals.goals_header
  account.display_savings
  goals.goal_term(account.savings, goals.goals)
