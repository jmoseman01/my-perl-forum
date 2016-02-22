#!/usr/bin/perl -w
use warnings;
use strict;
use DBI;
use CGI qw/:standard/;
use CGI::Carp qw/fatalsToBrowser/;
use navbargen;
use my_subs;


print "Content-Type: text/html\n\n";

my ($time_str,$date_str)=my_subs::grab_time_strs();

my $name = param('thread_name');
my $threadname=my_subs::space_to_und($name);
eval{
	if (my_subs::valid_chars($threadname)){
		my $db = DBI->connect("dbi:SQLite:web.db","","",{RaiseError => 1,AutoCommit => 1});
		$db->do("create table $threadname(id INTEGER PRIMARY KEY,comment)");
		$db->do("insert into threads(name, time, date) values('$name','$time_str','$date_str')");
		$db->disconnect;
		navbargen::print_top("thread");
		print "\t";
		print div({-id=>"content"});
		print p("name of thread:   $name");
		print p("time is:          $time_str");
		print p("date is:          $date_str");
		print a({-href=>"forum.cgi"},"go back to forum");
	}
	else{
		navbargen::print_top("thread");
		print "\t";
		print div({-id=>"content"});
		print p("invalid thread name");
		print a({-href=>"../add_thread.html"},"go back to create thread page");
	}
1;
} or do {
	navbargen::print_top("thread");
	print "\t";
	print div({-id=>"content"});
	print p("invalid thread name");
	print a({-href=>"../add_thread.html"},"go back to create thread page");
};

navbargen::print_validator();
print "\t</div>\n</body>\n</html>";
