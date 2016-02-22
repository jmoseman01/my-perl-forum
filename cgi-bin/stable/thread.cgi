#!/usr/bin/perl -w
use warnings;
use strict;
use DBI;
use CGI qw/:standard/;
use CGI::Carp qw/fatalsToBrowser/;
use navbargen;
use my_subs;
print "Content-Type: text/html\n\n"; 
navbargen::print_top("thread");

my $thread_name=param('thread_name');
#alters spaces to _ so $thread_name can be queried
my $thread_db_name=my_subs::space_to_und($thread_name);
print '<div id="thread_content">';
print h1("$thread_name");

#connect to db
my $db = DBI->connect("dbi:SQLite:web.db","","",{RaiseError => 1,AutoCommit => 1});
#making an array reference to the comments in the db of the thread name
my $all = $db->selectall_arrayref("select comment from $thread_db_name");
#iterator to make id tags of  1 and 2 to alternate styles
my $i=0;
#generates comments
foreach my $row (@$all){
	my ($comment)= @$row;
	if($i==0){
		my $classnum=$i % 2 + 1;
		print pre({-id=>"first_comment"},"\n$comment");
		}
	else{
		my $classnum=$i % 2 + 1;
		print pre({-class=>"comment$classnum"},"\n$comment");
	}
	$i++
}
$db->disconnect;
print "\n";
print h3("add comment");
print <<HTML;
<form action="added_comment.cgi" method="get">
	<label id="comment_textarea"><textarea name="comment"></textarea></label>
	<br />
	<input type="submit" name="sbutton" value="add"/>
	<input type="reset" value="reset"/>
HTML
#used to pass thread name to added_comment.cgi so it can add the comment to the table $thread_name
print hidden('thread_name','$thread_name');
print "\n\t</form>\n";
navbargen::print_validator();
print "</div>\n</body>\n</html>";
