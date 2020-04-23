require 'tty-prompt'
require 'tty-box'
require_relative 'account.rb'
#This class is designed to hold all of the reusable methods used across classes to keep the code clean and DRY
class Methods < Account

    attr_accessor :add_spending, :spending_table, :essentials, :header
    
    #method for adding items to user essentials hash
    #error handling: int check, 
    def header(title)
        puts title.center(50, " ").cyan
    end

    def centered(string)
        string.center(80, " ")
    end

    def add_spending(hash, options, header)
        puts `clear`
        puts header
        puts centered("Add an item, type [options] for some suggestions, or press [enter] to move on.")
        print "Item: "
        add_item = gets.chomp
          if add_item == ""
            puts `clear`
          elsif add_item == "options"
            options.each{ |x| print "#{x}  ".cyan}
            print "\n"
            add_spending(hash, options, header)
          else
            print "Spending: "
            add_value = gets.chomp
            hash[add_item] = add_value.to_i
            add_spending(hash, options, header)
        end
    end

    #resuable method for tabling items into format in each method
    def tabled_format(item, value) #DRY
        "#{item.capitalize}" + " "*(75 - item.length) + "$#{value}"
    end

    #prints costs list in tabled format with total
    def spending_table(hash, total)
        puts "".center(80, "_")
      hash.each{ |item, value| puts tabled_format(item, value) }
        puts "".center(80, "_")
      total = hash.values.inject(:+)
        puts tabled_format("Total", total)
        prompt = TTY::Prompt.new
        prompt.keypress("Press enter to continue", keys: [:return])
        puts `clear`
    end

    def instruct_bar
        puts "".center(80, "_").cyan
        options = "[options]: suggestions || [enter]: continue || [exit]: program"
        puts options.center(80, " ").underline.cyan
        return self
    end

    def main_menu
        prompt = TTY::Prompt.new
        prompt.select("") do |menu|
            menu.choice 'Begin New Budget'.center(50)
            menu.choice 'Edit Existing'.center(50)
            menu.choice 'Quit'.center(50)
        end
    end

end

# require 'colorize'

# image1 = "
#                         *%#%                                                    
#                        %&%**#%                                                  
#                       %%&&*/**&&                                                
#                      %&&&%(////&&    %#%##                                      
#                      %#%&&&///(/(& %%%%##&&                                     
#                     (%%&&&&(%//(*@%%%#%&&&&&                                    
#                    %#&%&&&@(////#%%#*%%%&&@&                                    
#                   %%%&&&&@&////%%/%(//%%@&@&                                    
#                  %(/&&&&@%@/(%&//(&&%&@&@&&                                     
#                  %&%@@@@@@@@#%//%#//@&&&@&@                                     
#                 &&%@@#%&@@&%%/#&**@@@%&@@&                                      
#                 &&&@&@&&%#%//%&@&/@/&&@@@@                                      
#                  &&@&&@&%%/%@#*//@//*&@@&                                       
#                    @@@@@&&(%&/*/&@*/@&@@&                                       
#              ,***(/,,&@@%%*%&#(@@&(/#@@@                                        
#            @*/*/***,,&@&/#@&@&**/@@/@%@   @                                     
#           (/*///,,%**(@*%@@/**@@//&@@@         /@                               
#          (/**///@,%@,,****,***//@@&@& .  ,                                      
#         @/%///,,(/**//*******,%@@@%*/@@@ ,                                      
#         &****,,,(,**&*/&/////(@@*#&@@%                                          
#          %**.,@,(/**///((((*.,* %%     *&                                       
#             &,,.,,#///   .%   &                                                 
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                                                                         
                                                                                
# ".colorize(:cyan)
# image2 = "
                                                                                
                                                                                
                                                                                
                                                                                
#                    #&#%%                                                        
#                   %%%#/**%%                                                     
#                  .%%%&**(//&%                                                   
#                  %#%&&&***%**&*                                                 
#                 #%%%&&&%//*/**&&                                                
#                #/%%&&&@(///****&                                                
#                %%%%&&%@@*///**/*@                                               
#               #*#%%&@&@@@@%//////@                %%%&                          
#               %%%@&%@@&@@////////@             %%&&&@                           
#              ,&%&@@%%@@@@@////*/*/@         .%/#%&@                             
#               &&&@&@&&%@@@@/*/****/       &/%&&&&                               
#                (&@@@@&&&&@@&@******&   %/&(%&@@                                 
#              @&%&&@@@@@&&&&@@@&****@#%&/(/%&@                                   
#            ***/**,#*,,@@&@@@@@@#**%/&/@//@&                                     
#          (*****,*,,,,,*,,&/**@&%#%@&@@/@@                                       
#        @******/*(*,,,,,,,,/,/,%&&&*/&&       *@#(                               
#        &***/**/**/((///***@*#%*//@@(/@@@ ,                                      
#        %*****/*********/**&**/#&/%&@@%                                          
#         (/**********/(/%(//(.,* %&     *&                                       
#           *&&&#%%/(*/##. .%   &                                                 
#                *,*(                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
# ".colorize(:magenta)
# image3 = "
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
#                    (##***%&                                                     
#                   *%%%(**/**&&                                                  
#                   ##%%&&(***/*&&                                                
#                  #%%%&&&*****/*&&                                               
#                 %%%&&@@&/////////&                                              
#                #*%&&@@@@@@///*//*%                                              
#               %%%%@%%@@@@@//******@                                             
#               #&&&%@&&%%@@@@/******,                                            
#                 &@@@&@%&&&@&@@%****&                                            
#              %&//*,,%@@@@@@@@@@@/**&    (             ,&@%#(**(#&%%             
#            /****/*,,,*,,,//***@#@#@#   .   ,%****/////**/(**/(#%#               
#          (***//*./,..,,,,,,,,*(%&%@*@%/((&##////&@%@@&&&%&%                     
#         (********///*///****,(&&%(,*/@&&&&&@@@@&&%##.                           
#        %*********/*,*,,%(,,,***,*,,@@@%&&&&%#(                                  
#         &**,*****%#%*    #*//,(,**@                                             
#                      (***//****.                                                
#                   &********                                                     
#                  &&&                                                            
                                                                                
                                                                                
                                                                                
                                                                                
# ".colorize(:light_red)
# image4 = "
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
#                         #%#///*#&%                                              
#                       ,%%&&&///***&                                             
#                      (%%&&&*/////*/&                                            
#                    /#%&&@@@@/*//****&                                           
#                   %%&@%%@@@@@@#*****&                                           
#                  %&&@&@@&&&&&@@@@**@   #                                        
#                    %,***%@/****//#@,*@@@ , %&                                   
#               #*****,*,,,,**//%&#@@,@@@@#*************(&&@                      
#            *****/////****%,,,(,/**,***@@@@@@@%*//*/////////***/&&&(             
#           //,****/,*##.  */(**/*,,*,&/&@&&&@@@@@&//*//#///**//**(**/&%%         
#          @***,#%&     ,%#****(/,.,,**%@@@@&&&%@@@@@@@@&&&&@#/#(/***/***&%       
#                     %(,,****//*/*,*,,,@@&&%&@@%%%&&&&&&%&&%&&%&&&%%&%%#%%       
#                    &****/*///*/*****##  &&&&&&%%(//*%%%(%(/%%%#%%(              
#                   /*(***********#@                                              
#                      ,,   ,                                                     
                                                                                
                                                                                
# ".colorize(:green)
# image5 = "
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
#                    (##***%&                                                     
#                   *%%%(**/**&&                                                  
#                   ##%%&&(***/*&&                                                
#                  #%%%&&&*****/*&&                                               
#                 %%%&&@@&/////////&                                              
#                #*%&&@@@@@@///*//*%                                              
#               %%%%@%%@@@@@//******@                                             
#               #&&&%@&&%%@@@@/******,                                            
#                 &@@@&@%&&&@&@@%****&                                            
#              %&//*,,%@@@@@@@@@@@/**&    (             ,&@%#(**(#&%%             
#            /****/*,,,*,,,//***@#@#@#   .   ,%****/////**/(**/(#%#               
#          (***//*./,..,,,,,,,,*(%&%@*@%/((&##////&@%@@&&&%&%                     
#         (********///*///****,(&&%(,*/@&&&&&@@@@&&%##.                           
#        %*********/*,*,,%(,,,***,*,,@@@%&&&&%#(                                  
#         &**,*****%#%*    #*//,(,**@                                             
#                      (***//****.                                                
#                   &********                                                     
#                  &&&                                                            
                                                                                
                                                                                
                                                                                
                                                                                
# ".colorize(:yellow)
# image6 = "
                                                                                
                                                                                
                                                                                
                                                                                
#                    #&#%%                                                        
#                   %%%#/**%%                                                     
#                  .%%%&**(//&%                                                   
#                  %#%&&&***%**&*                                                 
#                 #%%%&&&%//*/**&&                                                
#                #/%%&&&@(///****&                                                
#                %%%%&&%@@*///**/*@                                               
#               #*#%%&@&@@@@%//////@                %%%&                          
#               %%%@&%@@&@@////////@             %%&&&@                           
#              ,&%&@@%%@@@@@////*/*/@         .%/#%&@                             
#               &&&@&@&&%@@@@/*/****/       &/%&&&&                               
#                (&@@@@&&&&@@&@******&   %/&(%&@@                                 
#              @&%&&@@@@@&&&&@@@&****@#%&/(/%&@                                   
#            ***/**,#*,,@@&@@@@@@#**%/&/@//@&                                     
#          (*****,*,,,,,*,,&/**@&%#%@&@@/@@                                       
#        @******/*(*,,,,,,,,/,/,%&&&*/&&       *@#(                               
#        &***/**/**/((///***@*#%*//@@(/@@@ ,                                      
#        %*****/*********/**&**/#&/%&@@%                                          
#         (/**********/(/%(//(.,* %&     *&                                       
#           *&&&#%%/(*/##. .%   &                                                 
#                *,*(                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
# ".colorize(:light_blue)
# n = 0
# while n < 4
#   n += 1
# puts image1
# sleep(0.2)
# puts `clear`
# puts image2
# sleep(0.2)
# puts `clear`
# puts image3
# sleep(0.2)
# puts `clear`
# puts image4
# sleep(0.2)
# puts `clear`
# puts image4
# sleep(0.2)
# puts `clear`
# puts image5
# sleep(0.2)
# puts `clear`
# puts image6
# puts `clear`
# end
# puts image2
# sleep(2)