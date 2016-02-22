package my_subs;

sub str_to_arr{
	my $x=$_[0];
	my $length_str=length($x);
	my @newarr=();
	for(my $i=0;$i<$length_str;$i++){
		my $val=chop($x);
		unshift(@newarr,$val);
	}
	return @newarr;
}
sub arr_to_str{
	my $str = "";
	foreach(@_){
		$str.=$_;
		}
	return $str;
}

sub space_to_und{
	my $x=$_[0];
	my $length_str=length($x);
	my @newarr=();
	for(my $i=0;$i<$length_str;$i++){
		my $val=chop($x);
		if ($val ne " "){
			unshift(@newarr,$val);
		}
		else{
			unshift(@newarr,"_");
			}
	}
	my $undstr = "";
	foreach(@newarr){
		$undstr.=$_;
		}
		
	return $undstr;
}

sub url_enc{
	my $x=$_[0];
	my $length_str=length($x);
	my @newarr=();
	for(my $i=0;$i<$length_str;$i++){
		my $val=chop($x);
		if ($val ne " "){
			unshift(@newarr,$val);
		}
		else{
			unshift(@newarr,"%20");
			}
	}
	my $undstr = "";
	foreach(@newarr){
		$undstr.=$_;
		}
		
	return $undstr;
}

sub ap_to_apap{
	my $x=$_[0];
	my $length_str=length($x);
	my @newarr=();
	for(my $i=0;$i<$length_str;$i++){
		my $val=chop($x);
		if ($val ne "'"){
			unshift(@newarr,$val);
		}
		else{
			unshift(@newarr,"''");
			}
	}
	my $undstr = "";
	foreach(@newarr){
		$undstr.=$_;
		}
		
	return $undstr;
}

#if element in array return true el_in(str,arr)
sub el_in{
	my $str=$_[0];
	my @arr=@_;
	foreach $el (@_[1..$#arr]){
		if($str eq $el){
			return 1;
		} 
	}
	return 0;
}

sub valid_chars{
	my $inpstr=$_[0];
	my @alpha = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);
	my @alphacaps=();
	foreach(@alpha){
		push(@alphacaps,"\u$_");
	}
	my @alphas = (@alpha,@alphacaps);
	my @numbers = qw(1 2 3 4 5 6 7 8 9);
	my @validchars = (@alphas,@numbers," ","_");
	@inpstrarr=str_to_arr($inpstr);
	foreach(@inpstrarr){
		if (el_in($_,@validchars)){
		}
		else{
			return 0;
			}
	}
	return 1;
}
sub grab_time_strs{
	my @time=localtime(time);

	my ($sec,$min,$hour,$day,$month,$num_since_1900)=@time[0..5];
	my $year=$num_since_1900+1900;
	$month+=1;
	my $amtag = "A.M.";
	if ($hour > 12){
	 $hour -=12;
	 $amtag = "P.M.";
	}
	elsif($hour==0){
		$hour = 12
		}
	
	if($sec < 10){
		$sec='0'.$sec
		}
	if($min < 10){
		$min='0'.$min
		}
	
	my $time_str = "$hour:$min:$sec $amtag";
	my $date_str = "$month/$day/$year";
	return ($time_str,$date_str)
}

1;


