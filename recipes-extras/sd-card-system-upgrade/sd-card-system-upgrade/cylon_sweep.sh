#!/bin/sh                                                                                                                  
  LED_BLU=/sys/class/leds/LED_BLU                                                                                               
  LED_GRN=/sys/class/leds/LED_GRN                                                                                               
  LED_RED=/sys/class/leds/LED_RED                                                                                               
  LED_YEL=/sys/class/leds/LED_YEL                                                                                               
  echo none > ${LED_BLU}/trigger                                                                                                
  echo none > ${LED_GRN}/trigger                                                                                                
  echo none > ${LED_RED}/trigger                                                                                                
  echo none > ${LED_YEL}/trigger                                                                                                
                                                                                                                                
  STATE=1                                                                                                                       
  while : ; do                                                                                                                  
    case $STATE in                                                                                                              
      1)                                                                                                                        
        echo 255 > ${LED_BLU}/brightness                                                                                        
        echo 0   > ${LED_YEL}/brightness                                                                                        
        STATE=2                                                                                                                 
        ;;                                                                                                                      
      2)                                                                                                                        
        echo 255 > ${LED_YEL}/brightness                                                                                        
        echo 0   > ${LED_BLU}/brightness                                                                                        
        STATE=3                                                                                                                 
        ;;                                                                                                                      
      3)                                                                                                                        
        echo 255 > ${LED_GRN}/brightness                                                                                        
        echo 0   > ${LED_YEL}/brightness                                                                                        
        STATE=4                                                                                                                 
        ;;                                                                                                                      
      4)                                                                                                                        
        echo 255 > ${LED_RED}/brightness                                                                                        
        echo 0   > ${LED_GRN}/brightness                                                                                        
        STATE=5                                                                                                                 
        ;;                                                                                                                      
      5)                                                                                                                        
        echo 255 > ${LED_GRN}/brightness                                                                                        
        echo 0   > ${LED_RED}/brightness                                                                                        
        STATE=6                                                                                                                 
        ;;                                                                                                                      
      6)                                                                                                                        
        echo 255 > ${LED_YEL}/brightness                                                                                        
        echo 0   > ${LED_GRN}/brightness                                                                                        
        STATE=1                                                                                                                 
        ;;                                                                                                                      
      *)                                                                                                                        
        echo 255 > ${LED_BLU}/brightness                                                                                        
        echo 0   > ${LED_YEL}/brightness                                                                                        
        STATE=2                                                                                                                 
        ;;                                                                                                                      
        esac                                                                                                                    
        sleep 0.1                                                                                                               
    done   
