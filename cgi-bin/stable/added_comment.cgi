#!/usr/bin/perl -w
use warnings;
use strict;
use DBI;
use CGI qw/:standard/;
use CGI::Carp qw/fatalsToBrowser/;
use navbargen;
use my_subs;
print "Content-Type: text/html\n\n";
navbargen::print_top("added comment");

my $db = DBI->connect("dbi:SQLite:web.db","","",{RaiseError => 1,AutoCommit => 1});
my $name = param('thread_name');
#alters name spaces to underscores to be put into db
my $threadname=my_subs::space_to_und($name);
#alters thread name to be passed through the url
my $urlname=my_subs::url_enc($name);

my $comment = param('comment');
my $sqlcomment = my_subs::ap_to_apap($comment);
$db->do("insert into $threadname(comment) values('$sqlcomment')");
$db->disconnect;
print "\t";
print div({-id=>"content"});
print p("you added $comment");
print a({-href=>"thread.cgi?thread_name=$urlname"},"go back to thread");
navbargen::print_validator();
print "t\</div>\n</body>\n</html>";
