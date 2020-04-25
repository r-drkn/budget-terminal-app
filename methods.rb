require 'tty-prompt'
require 'colorize'

    def add_optional(hash)
        puts `clear`
        puts header("Add a cost or press enter to skip\n")
        prompt = TTY::Prompt.new
        hash = prompt.collect do
            key(:rent).ask('Rent:', convert: :int)
            key(:groceries).ask('Groceries: ', convert: :int)
            key(:bills).ask('Bills: ', convert: :int)
            key(:phone).ask('Phone: ', convert: :int)
            key(:transport).ask('Transport: ', convert: :int)
            while prompt.yes?("'Would you like to add anything else?'")
                print "Item: "
                key(gets.chomp.downcase.to_sym).ask('Cost: ', convert: :int)
                end
            end
        hash.delete_if { |k, v| v == nil || 0}
    end



    #method for adding items to user essentials hash
    #error handling: int check, 
    def header(title)
        puts title.center(50, " ")
    end

    def centered(string)
        string.center(80, " ")
    end


    # def add_spending(hash, options, header, spending_bar)
    #     puts `clear`
    #     puts spending_bar
    #     puts header
    #     puts centered("Add a cost, type [options] for some suggestions, or press [enter] to move on.\n")
    #     puts "Item: "
    #     add_item = gets.chomp
    #       if add_item == ""
    #         puts `clear`
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
        prompt = TTY::Prompt.new
        prompt.select("") do |menu|
            menu.choice 'Begin New Budget'.center(50)
            menu.choice 'Edit Existing'.center(50)
            menu.choice 'Quit'.center(50)
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
puts image1
sleep(0.2)
puts `clear`
puts image2
sleep(0.2)
puts `clear`
puts image3
sleep(0.2)
puts `clear`
puts image4
sleep(0.2)
puts `clear`
puts image4
sleep(0.2)
puts `clear`
puts image5
sleep(0.2)
puts `clear`
puts image6
puts `clear`
end
puts image1
sleep (0.2)
puts `clear`
puts image7.light_magenta
end