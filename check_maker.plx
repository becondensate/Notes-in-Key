#!\usr\bin\perl
use warnings;
use strict;

my %notes = (
1 => "A",
2 => "Asharp",
3 => "B",
4 => "C",
5 => "Csharp",
6 => "D",
7 => "Dsharp",
8 => "E",
9 => "F",
10 => "Fsharp",
11 => "G",
12 => "Gsharp"
);
my $file1 = "A.txt";
my $file2 = "all_notes.txt";
my $new_string;
my $old_string = 'my $Acv;';
open FILE1, "$file1" or die "Couldn't open file: $file1 $!", "\n";
open FILE2, ">$file2" or die "Couldn't open file: $file2 $!", "\n";
while (<FILE1>) {

		s/A/$notes{2}/g;
		print FILE2;
	}

