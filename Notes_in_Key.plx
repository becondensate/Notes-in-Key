#!/usr/bin/perl
use warnings;
#use strict;

use Tkx;
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

my %flat_notes = (
1 => "A",
2 => "Bb",
3 => "B",
4 => "C",
5 => "Db",
6 => "D",
7 => "Eb",
8 => "E",
9 => "F",
10 => "Gb",
11 => "G",
12 => "Ab"
);
my $choice_var;
#$choice_var = "Major#";
my $key_entry;
my $meta_note;
my $key_notes;
my $mw = Tkx::widget->new(".");
Tkx::wm_title(".", "Notes in Key");
Tkx::ttk__frame(".c", -padding => "3 3 12 12");
Tkx::grid( ".c", -column => 0, -row => 0, -sticky => "nwes");
Tkx::grid_columnconfigure( ".", 0, -weight => 1);
Tkx::grid_rowconfigure(".", 0, -weight => 1);

#Tkx::ttk__entry(".c.key", -width => 7, -textvariable => \$key_entry);
#Tkx::grid(".c.key", -column => 3, -row => 2, -sticky => "we");

Tkx::ttk__button(".c.button", -text => "Get Key", -command => sub {Get_Key();}); #{Get_Key();}); #sub in this row
Tkx::grid(".c.button", -column => 2, -row => 2, -sticky => "we");
Tkx::ttk__label(".c.notes", -textvariable => \$meta_note);
Tkx::grid(".c.notes", -column => 1, -row => 4, -sticky => "we");

Tkx::grid( Tkx::ttk__label(".c.enter_key_label", -text => "Enter key to find out the notes: "), -column => 1, -row => 1, -sticky => "w");
#Tkx::grid( Tkx::ttk__label(".c.note_number_label", -text => "I\tii\tiii\tIV\tV\tvi\tvii\"), -column => 1, -row => 3);
foreach (Tkx::SplitList(Tkx::winfo_children(".c"))) { Tkx::grid_configure($_, -padx => 5, -pady => 5); }
Tkx::focus(".c.key");
Tkx::bind(".", "<Return>", sub {&Get_Key();}); #sub in this row

my $key_matches;
Tkx::ttk__label(".c.notes2", -textvariable => \$key_matches);
Tkx::grid(".c.notes2", -column => 2, -row => 4, -sticky => "we");

my $note_entry;
my $entry = Tkx::ttk__entry(".c.noteentry", -width => 7, -textvariable => \$note_entry);
Tkx::grid(".c.noteentry", -column => 3, -row => 2, -sticky => "e");

Tkx::ttk__button(".c.button2", -text => "Search for key", -command => sub {Key_Match();}); #{Key_Match();}); #sub in this row
Tkx::grid(".c.button2", -column => 4, -row => 2, -sticky => "we");

my $choice = Tkx::widget->new(".c.combo");
Tkx::ttk__combobox(".c.combo", -textvariable => \$choice_var);
Tkx::grid(".c.combo", -column => 1, -row => 2, -sticky => "we");
$choice ->configure(-values => "A A# Bb B C C# Db D D# Eb E F F# Gb G G# Ab");

my $minor_option;
my $check_button_minor = $mw->new_ttk__checkbutton(-text => "Minor", -command => sub {Minor}, -variable => \$minor_option, -onvalue => "minor", -offvalue => "major");
Tkx::grid($check_button_minor, -column => 2, -row => 2);   

my $flat_option;
$flat_option = "sharp";
my $check_button_flat = $mw->new_ttk__checkbutton(-text => "Flat", -command => sub {Flat_ch}, -variable =>\$flat_option, -onvalue => "flat", -offvalue => "sharp");
Tkx::grid($check_button_flat, -column => 1, -row => 2);
sub Flat_ch {
	$flat_option = "flat";
	print $flat_option;
	}
$minor_option = "major";
		
sub Minor_ch {
	$minor_option = "minor";
	}
########################################################################

my $Acv;
my $Ac = Tkx::widget->new(".c.ac");
Tkx::ttk__combobox(".c.ac", -textvariable => $Acv);
Tkx::grid(".c.ac", -column => 3 -row => 3, -sticky => "e");
	
	
	
########################################################################
sub Get_Key {

my $line_holder;
my @notes;
my @array_holder;
#my $line_co;
#$line_co = 0;
my $z;
my $boo1 = 0;
 open(NOTE_DATA, "note_data.txt");
    while (<NOTE_DATA>) {	#$line_co = $line_co + 1;
	$line_holder = $_;
		if ($line_holder =~ /(# $choice_var )/){
		$boo1 = $boo1 +1;
			if ($boo1 < 2) {
			(@array_holder[0..9]) = split(/ /);
				if ($minor_option eq "major") {
					for ($z = 2; $z <= 8; $z += 1) {
						if ($choice_var =~ /b$/ && $flat_option eq "flat") {
						push @notes, $flat_notes{$array_holder[$z]}, "\t";
						}
						elsif ($choice_var =~ /b$/ && $flat_option eq "sharp") {
						push @notes, $sharp_notes{$array_holder[$z]}, "\t";
						}
						elsif ($choice_var =~ /\b\w\b/ && $flat_option eq "sharp") {
						push @notes, $sharp_notes{$array_holder[$z]}, "\t";
						}
						elsif ($choice_var =~ /\b\w\b/ && $flat_option eq "flat") {
						push @notes, $flat_notes{$array_holder[$z]}, "\t";
						}
						else {
						push @notes, $sharp_notes{$array_holder[$z]}, "\t";
						}
					}
				}
				else {
				$array_holder[4] = $array_holder[4] - 1;
					for ($z = 2; $z <= 8; $z += 1) {
						if ($choice_var =~ /b$/ && $flat_option eq "flat") {
						push @notes, $flat_notes{$array_holder[$z]}, "\t";
						}
						elsif ($choice_var =~ /b$/ && $flat_option eq "sharp") {
						push @notes, $sharp_notes{$array_holder[$z]}, "\t";
						}
						elsif ($choice_var =~ /\b\w\b/ && $flat_option eq "sharp") {
						push @notes, $sharp_notes{$array_holder[$z]}, "\t";
						}
						elsif ($choice_var =~ /\b\w\b/ && $flat_option eq "flat") {
						push @notes, $flat_notes{$array_holder[$z]}, "\t";
						}
						else {
						push @notes, $sharp_notes{$array_holder[$z]}, "\t";
						}
						
					}
				}
			}
		}
	$meta_note = join(" ", @notes);
	}
}

###################################################################3


sub Key_Match {
	my @note_entry_arr;
	my $zz;
	my $aa;
	my $line_holder2;
	my $match_counter;
	my @note_data_arr;
	my $note_data;
	my @matches_arr;
	open(NOTE_DATA, "note_data.txt");
    while (<NOTE_DATA>) {
		$line_holder2 = $_;
		(@note_data_arr) = split(/ /);
			for	($aa = 0; $aa <= $#note_data_arr; $aa += 1) {
				$note_data = $note_data_arr[$aa];
				(@note_entry_arr) = split(/ /, $note_entry);
					for ($zz = 0; $zz <= $#note_entry_arr; $zz += 1) {
						if ($note_entry_arr[$zz] eq $note_data) {
							push @matches_arr, $note_data;
						
					$key_matches = join(" ", @matches_arr);
				}
			}
		}
	}
}

Tkx::MainLoop();

# Can switch sharp keys' notes to flats, but can't change flat keys' notes to sharps