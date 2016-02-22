package navbargen;
sub print_top{
print <<HTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
HTML
	print"<title>$_[0]</title>\n";
print<<html2;	
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../my.css" />

</head>
   
<body> 
<div id="navbar">
	<ul>
		<li><a href="../index.html">home</a></li>
		<li><a href="../info.html">info</a></li>
		<li><a href="../FAQ.html">FAQ</a></li>
		<li><a href="../contact_info.html">contact info</a></li>
html2
if($_[0] eq "Forum"){print '<li><a id="selected" href="forum.cgi">forum</a></li>';}
else                {print'<li><a href="forum.cgi">forum</a></li>';}
print<<html5;
	</ul>
</div>

<img id="logo" src="../images/logo.png" alt="logo" />
html5
}
sub print_validator{
print <<html3;
<p><a class="hover_diff" href="http://validator.w3.org/check?uri=referer">
        <img style="border:0px;height:31px;width:88px;" 
            src="http://www.w3.org/Icons/valid-xhtml10-blue.png"
            alt="Valid XHTML 1.0 Tansitional" /></a>
        
        <a class="hover_diff" href="http://jigsaw.w3.org/css-validator/check/referer">
        <img style="border:0px;height:31px;width:88px;" 
            src="http://jigsaw.w3.org/css-validator/images/vcss-blue"
            alt="Valid CSS!" /></a>
</p>
html3
}
1;
