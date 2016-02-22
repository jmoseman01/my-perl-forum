#!/usr/bin/perl -w
use navbargen;
use warnings;
use strict;
use DBI;
use CGI qw/:standard/;
use CGI::Carp qw/fatalsToBrowser/;
print "Content-Type: text/html\n\n";
my $db = DBI->connect("dbi:SQLite:web.db","","",{RaiseError => 1,AutoCommit => 1});
my $all = $db->selectall_arrayref("select name,time,date from threads");

navbargen::print_top("Forum"); 
print '<div id="thread_content">';
print a({-id=>"create_thread_link", -href=>"../add_thread.html"},"create thread");

print <<HTML;
<table id="forum_table" width="100%">
<tr>
<th>Thread</th><th>Time</th><th>Date</th>
</tr>
HTML
foreach my $row (@$all){
        my ($name,$time,$date)= @$row;
        print Tr(td(a({-href=>"thread.cgi?thread_name=$name"},"$name")), td("$time"), td("$date"));
        }
$db->disconnect;
print "</table>";
navbargen::print_validator();
print "</div>\n</body>\n</html>";
