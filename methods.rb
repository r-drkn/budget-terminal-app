require 'tty-prompt'
require 'colorize'

    def add_optional(hash)
        clear
        puts centered("Add a cost or press enter to skip\n")
        prompt = TTY::Prompt.new
        hash = prompt.collect do
            while prompt.yes?("'Would you like to add anything else?'")
                print "Item: "
                key(gets.chomp.downcase).ask('Cost: ', convert: :int)
                if hash.include?(prompt)
                end
              end
            end
        hash.delete_if { |k, v| v == nil || 0}
    end



    #method for adding items to user essentials hash
    #error handling: int check, 
    def header(title)
        title.center(80, " ")
    end

    def centered(string)
        string.center(80, " ").rstrip
    end


    # def add_spending(hash, options, header, spending_bar)
    #     clear
    #     puts spending_bar
    #     puts header
    #     puts centered("Add a cost, type [options] for some suggestions, or press [enter] to move on.\n")
    #     puts "Item: "
    #     add_item = gets.chomp
    #       if add_item == ""
    #         clear
    #       elsif add_item == "options"
    #         options.each{ |x| print "#{x}  ".cyan}
    #         print "\n"
    #         add_spending(hash, options, header, spending_bar)
    #       else
    #         print "Spending: "
    #         add_value = gets.chomp
    #         hash[add_item] = add_value.to_i
    #         add_spending(hash, options, header, spending_bar)
    #     end
    # end

    def clear
        puts "\e[2J\e[f"
    end 
    
    #resuable method for tabling items into format in each method
    def tabled_format(item, value) #DRY
        "#{item.capitalize}" + " "*(75 - item.length) + "$#{value}"
    end

    def instruct_bar
        puts "".center(80, "_").cyan
        options = "[options]: suggestions || [enter]: continue || [exit]: program"
        puts options.center(80, " ").underline.cyan
        return self
    end

    def main_menu
        prompt = TTY::Prompt.new(active_color: :cyan)
        prompt.select("") do |menu|
            menu.choice 'Begin New Budget'
            menu.choice 'Edit Existing'
            menu.choice 'Quit'
        end
    end

    #method for validating if item has numbers in it
    class InvalidItemError < StandardError
    end

    def validate_item(item)
        raise InvalidItemError,
        "Item cannot include numbers".light_red if item.to_s =~ /\d/
        item
    end



    def butterfly_intro
image1 = "



                        *%#%                                                    
                       %&%**#%                                                  
                      %%&&*/**&&                                                
                     %&&&%(////&&    %#%##                                      
                     %#%&&&///(/(& %%%%##&&                                     
                    (%%&&&&(%//(*@%%%#%&&&&&                                    
                   %#&%&&&@(////#%%#*%%%&&@&                                    
                  %%%&&&&@&////%%/%(//%%@&@&                                    
                 %(/&&&&@%@/(%&//(&&%&@&@&&                                     
                 %&%@@@@@@@@#%//%#//@&&&@&@                                     
                &&%@@#%&@@&%%/#&**@@@%&@@&                                      
                &&&@&@&&%#%//%&@&/@/&&@@@@                                      
                 &&@&&@&%%/%@#*//@//*&@@&                                       
                   @@@@@&&(%&/*/&@*/@&@@&                                       
             ,***(/,,&@@%%*%&#(@@&(/#@@@                                        
           @*/*/***,,&@&/#@&@&**/@@/@%@   @                                     
          (/*///,,%**(@*%@@/**@@//&@@@         /@                               
         (/**///@,%@,,****,***//@@&@& .  ,                                      
        @/%///,,(/**//*******,%@@@%*/@@@ ,                                      
        &****,,,(,**&*/&/////(@@*#&@@%                                          
         %**.,@,(/**///((((*.,* %%     *&                                       
            &,,.,,#///   .%   &                                                 
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                                                                         
                                                                                
"
image2 = "
                                                                                
                                                                                
                                                                                
                                                                                
                   #&#%%                                                        
                  %%%#/**%%                                                     
                 .%%%&**(//&%                                                   
                 %#%&&&***%**&*                                                 
                #%%%&&&%//*/**&&                                                
               #/%%&&&@(///****&                                                
               %%%%&&%@@*///**/*@                                               
              #*#%%&@&@@@@%//////@                %%%&                          
              %%%@&%@@&@@////////@             %%&&&@                           
             ,&%&@@%%@@@@@////*/*/@         .%/#%&@                             
              &&&@&@&&%@@@@/*/****/       &/%&&&&                               
               (&@@@@&&&&@@&@******&   %/&(%&@@                                 
             @&%&&@@@@@&&&&@@@&****@#%&/(/%&@                                   
           ***/**,#*,,@@&@@@@@@#**%/&/@//@&                                     
         (*****,*,,,,,*,,&/**@&%#%@&@@/@@                                       
       @******/*(*,,,,,,,,/,/,%&&&*/&&       *@#(                               
       &***/**/**/((///***@*#%*//@@(/@@@ ,                                      
       %*****/*********/**&**/#&/%&@@%                                          
        (/**********/(/%(//(.,* %&     *&                                       
          *&&&#%%/(*/##. .%   &                                                 
               *,*(                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
"
image3 = "
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                   (##***%&                                                     
                  *%%%(**/**&&                                                  
                  ##%%&&(***/*&&                                                
                 #%%%&&&*****/*&&                                               
                %%%&&@@&/////////&                                              
               #*%&&@@@@@@///*//*%                                              
              %%%%@%%@@@@@//******@                                             
              #&&&%@&&%%@@@@/******,                                            
                &@@@&@%&&&@&@@%****&                                            
             %&//*,,%@@@@@@@@@@@/**&    (             ,&@%#(**(#&%%             
           /****/*,,,*,,,//***@#@#@#   .   ,%****/////**/(**/(#%#               
         (***//*./,..,,,,,,,,*(%&%@*@%/((&##////&@%@@&&&%&%                     
        (********///*///****,(&&%(,*/@&&&&&@@@@&&%##.                           
       %*********/*,*,,%(,,,***,*,,@@@%&&&&%#(                                  
        &**,*****%#%*    #*//,(,**@                                             
                     (***//****.                                                
                  &********                                                     
                 &&&                                                            
                                                                                
                                                                                
                                                                                
                                                                                
"
image4 = "
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                        #%#///*#&%                                              
                      ,%%&&&///***&                                             
                     (%%&&&*/////*/&                                            
                   /#%&&@@@@/*//****&                                           
                  %%&@%%@@@@@@#*****&                                           
                 %&&@&@@&&&&&@@@@**@   #                                        
                   %,***%@/****//#@,*@@@ , %&                                   
              #*****,*,,,,**//%&#@@,@@@@#*************(&&@                      
           *****/////****%,,,(,/**,***@@@@@@@%*//*/////////***/&&&(             
          //,****/,*##.  */(**/*,,*,&/&@&&&@@@@@&//*//#///**//**(**/&%%         
         @***,#%&     ,%#****(/,.,,**%@@@@&&&%@@@@@@@@&&&&@#/#(/***/***&%       
                    %(,,****//*/*,*,,,@@&&%&@@%%%&&&&&&%&&%&&%&&&%%&%%#%%       
                   &****/*///*/*****##  &&&&&&%%(//*%%%(%(/%%%#%%(              
                  /*(***********#@                                              
                     ,,   ,                                                     
                                                                                
                                                                                
"
image5 = "
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                                                                                
                   (##***%&                                                     
                  *%%%(**/**&&                                                  
                  ##%%&&(***/*&&                                                
                 #%%%&&&*****/*&&                                               
                %%%&&@@&/////////&                                              
               #*%&&@@@@@@///*//*%                                              
              %%%%@%%@@@@@//******@                                             
              #&&&%@&&%%@@@@/******,                                            
                &@@@&@%&&&@&@@%****&                                            
             %&//*,,%@@@@@@@@@@@/**&    (             ,&@%#(**(#&%%             
           /****/*,,,*,,,//***@#@#@#   .   ,%****/////**/(**/(#%#               
         (***//*./,..,,,,,,,,*(%&%@*@%/((&##////&@%@@&&&%&%                     
        (********///*///****,(&&%(,*/@&&&&&@@@@&&%##.                           
       %*********/*,*,,%(,,,***,*,,@@@%&&&&%#(                                  
        &**,*****%#%*    #*//,(,**@                                             
                     (***//****.                                                
                  &********                                                     
                 &&&                                                            
                                                                                
                                                                                
                                                                                
                                                                                
"
image6 = "
                                                                                
                                                                                
                                                                                
                                                                                
                   #&#%%                                                        
                  %%%#/**%%                                                     
                 .%%%&**(//&%                                                   
                 %#%&&&***%**&*                                                 
                #%%%&&&%//*/**&&                                                
               #/%%&&&@(///****&                                                
               %%%%&&%@@*///**/*@                                               
              #*#%%&@&@@@@%//////@                %%%&                          
              %%%@&%@@&@@////////@             %%&&&@                           
             ,&%&@@%%@@@@@////*/*/@         .%/#%&@                             
              &&&@&@&&%@@@@/*/****/       &/%&&&&                               
               (&@@@@&&&&@@&@******&   %/&(%&@@                                 
             @&%&&@@@@@&&&&@@@&****@#%&/(/%&@                                   
           ***/**,#*,,@@&@@@@@@#**%/&/@//@&                                     
         (*****,*,,,,,*,,&/**@&%#%@&@@/@@                                       
       @******/*(*,,,,,,,,/,/,%&&&*/&&       *@#(                               
       &***/**/**/((///***@*#%*//@@(/@@@ ,                                      
       %*****/*********/**&**/#&/%&@@%                                          
        (/**********/(/%(//(.,* %&     *&                                       
          *&&&#%%/(*/##. .%   &                                                 
               *,*(                                                             
                                                                                
                                                                                
                                                                                
                                                                                
                  
                
"
image7 = "
                                                                                
                                                                                
                                                                                
                                                                                
                   #&#%%                                                        
                  %%%#/**%%                                                     
                 .%%%&**(//&%                                                   
                 %#%&&&***%**&*                                                 
                #%%%&&&%//*/**&&                                                
               #/%%&&&@(///****&                                                
               %%%%&&%@@*///**/*@                                               
              #*#%%&@&@@@@%//////@                %%%&                          
              %%%@&%@@&@@////////@             %%&&&@                           
             ,&%&@@%%@@@@@////*/*/@         .%/#%&@                             
              &&&@&@&&%@@@@/*/****/       &/%&&&&                               
               (&@@@@&&&&@@&@******&   %/&(%&@@                                 
             @&%&&@@@@@&&&&@@@&****@#%&/(/%&@                                   
           ***/**,#*,,@@&@@@@@@#**%/&/@//@&                                     
         (*****,*,,,,,*,,&/**@&%#%@&@@/@@                                       
       @******/*(*,,,,,,,,/,/,%&&&*/&&       *@#(                               
       &***/**/**/((///***@*#%*//@@(/@@@ ,                                      
       %*****/*********/**&**/#&/%&@@%                                          
        (/**********/(/%(//(.,* %&     *&                                       
          *&&&#%%/(*/##. .%   &                                                 
               *,*(                                                             
                                                                                
                                                                                
"

n = 0
while n < 3
  n += 1
puts image1.center(80)
sleep(0.2)
clear
puts image2.center(80)
sleep(0.2)
clear
puts image3.center(80)
sleep(0.2)
clear
puts image4.center(80)
sleep(0.2)
clear
puts image4.center(80)
sleep(0.2)
clear
puts image5.center(80)
sleep(0.2)
clear
puts image6.center(80)
clear
end
puts image1.center(80)
sleep (0.2)
clear
puts image7.center(80).light_magenta
sleep(2)
clear
end