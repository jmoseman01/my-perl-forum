from os import system
tablestodelete=["c_squared_is_awesome"                   
,"create_threads_and_stuff"               
,"dbs_are_awesome" 
,"derrek"                                 
,"dr_doom"                                
,"epic_fail"                              
,"foo_bar"                                
,"for_my_dad"                             
,"huh"                                    
,"i_man_5"                                
,"idk"                                    
]
print tablestodelete
for tablename in tablestodelete:
    deletecmd='sqlite3 web.db "drop table %s"'%(tablename)
    print deletecmd
    system(deletecmd)
