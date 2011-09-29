#!/usr/bin/perl
use strict;
use warnings;

my %sharp_notes = (
1 => "A",
2 => "A\#",
3 => "B",
4 => "C",
5 => "C\#",
6 => "D",
7 => "D\#",
8 => "E",
9 => "F",
10 => "F\#",
11 => "G",
12 => "G\#"
);


my $string = "A 6 8";
my $note_holder;
my @input_arr;
my @data_arr;
my @matches;
my $line_holder;
my $i;
my $j;

open (NOTE_DATA, "note_data_no_redundancies.txt") or die "Couldn't open data file $!", "\n";
while (<NOTE_DATA>) {
    @data_arr = split(/ /, $_);    
    @input_arr = split(/ /, $string);
        for ($j = 0; $j <= $#input_arr; $j += 1) {
            $note_holder = $input_arr[$j];
			print 'This is      $j: ', $j, "\n";
                for ($i = 0; $i <= $#data_arr; $i += 1) {
					print 'This is $i: ', $i, "\n";
					if ($note_holder eq $data_arr[$i]) {
						print $note_holder, "\t", $input_arr[$j], "\n";
						push @matches, $note_holder;
							#for (@matches) {
								#if ($_                                
									#if ($sharp_notes{$_}
					#}
            }
        }
    }
}
print 'This is $#data_arr: ', $#data_arr, "\n";
print 'This is $#input_arr: ', $#input_arr, "\n";
print 'This is $#matches: ', $#matches, "\n";
print "This is data_arr: ", join(" ", @data_arr), "\n";
print "This is input_arr: ", join(" ", @input_arr), "\n";
print "This is matches: ", join(" ", @matches);    





























