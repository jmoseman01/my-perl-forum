sqlite3 web.db "drop table  meh_no"                       
sqlite3 web.db "drop table morgan_spaces_too"                       
sqlite3 web.db "drop table my_thread_is_coolios"                       
sqlite3 web.db "drop table newest_test_on_the_newest_server"                       
sqlite3 web.db "drop table permissions_suck"                       
sqlite3 web.db "drop table seshuan"                       
sqlite3 web.db "drop table sql_injection"                       
sqlite3 web.db "drop table super_awesome_test"                       
sqlite3 web.db "drop table vimrc"                       
sqlite3 web.db "drop table your_a_boss"                       
sqlite3 web.db "drop table your_mom_runs_bsd"                       
sqlite3 web.db ".tables" | grep -v ^threads|Theory_of_comp > delete_tables.sh
