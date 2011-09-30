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

my $i;
my $file1 = "A.txt";
my $file2 = "all_notes.txt";
my $file3 = "all_notes2.txt";
my $counter;
$counter = 1;

open FILE2, ">$file2" or die "Couldn't open file: $file2 $!", "\n";
for ($i = 1; $i <= 12; $i += 1) {
open FILE1, "$file1" or die "Couldn't open file: $file1 $!", "\n";
	while (<FILE1>) {
		s/A/$notes{$i}/g;
		print FILE2 $_;
		}
	print FILE2 "\n\n";
	}

open FILE3, ">$file3" or die "Couldn't open file: $file2 $!", "\n";
open FILE2, "$file2" or die "$!", "\n";
	while (<FILE2>) {
		if (s/row => (\d)/row => $counter/g) {
		$counter = $counter + 1;
		}
		print FILE3 $_;
	}
	
			 

