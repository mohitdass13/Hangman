#!/usr/bin/perl
use strict;
use warnings;
use feature ":5.10";

# global variables
my @words = ("computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country",
"enviroment","classroom","animals","province","month","politics","puzzle","instrument","kitchen","language",
"vampire","ghost","solution","service","software","virus25","security","phonenumber","expert","website","agreement","support","compatibility","advanced","search","triathlon","immediately","encyclopedia",
"endurance","distance","nature","history","organization","international","championship","government",
"popularity","thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment",
"priority","physics","branche","science","mathematics","lightning","dispersion","accelerator","detector",
"terminology","design","operation","foundation","application","prediction","reference","measurement",
"concept","perspective","overview","position","airplane","symmetry","dimension","toxic","algebra",
"illustration","classic","verification","citation","unusual","resource","analysis","license","comedy",
"screenplay","production","release","emphasis","director","trademark","vehicle","aircraft","experiment");
my $n_of_attempts = 0;
my @guesses = ();
my $soln = 0;
&main();
my @misses = ();
my @unique;
sub main {
        my $word = @words [int(rand(3)) - 1];
        my $size = length($word);
        for (my $i=0; $i < $size; $i++) {
                $guesses [$i] = '_';
        }
        while (!$soln) {
                &hangmanPictures();
                print "\n\n";
                print "Word:  ";
                print join(" ", @guesses);
                print "\nPick a letter: ";
                my $guess = <>;
                chomp($guess); # remove newline
                
                &letterChecking($word, $guess);

                $soln = &checkWin($word);
        }

    print join(" ", @guesses);
    print "\n\n you win!\n";
}
sub hangmanPictures() {
    given($n_of_attempts) {
        when(0) {&hangmanPic1();}
        when(1) {&hangmanPic2();}
        when(2) {&hangmanPic3();}
        when(3) {&hangmanPic4();}
        when(4) {&hangmanPic5();}
        when(5) {&hangmanPic6();}
        when(6) {&hangmanPic7();}
    }
}
sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}
sub letterChecking {
    my ($word, $guess) = @_;
    my $letterIndex = index($word, $guess);
    if ($letterIndex == -1) {
        print "Wrong guess!\n";
        push(@misses,$guess);
        @unique=uniq(@misses);
        $n_of_attempts++;
    } else {
        for (my $i=0; $i < length($word); $i++) {
            my $c_letter = substr($word, $i, 1);
            if ($guess eq $guesses[$i]) {
                print "You already guessed $guess!\n";
            }
            if ($guess eq $c_letter) {
                $guesses [$i] = $c_letter;
            }
        }
    }
    print "Misses: @unique\n\n";
}
sub checkWin {
    my ($word) = @_;
    my $letter;
    for (my $i=0; $i< length($word); $i++) {
        $letter = substr($word, $i, 1);
        if ($letter ne $guesses [$i]) {
            return 0;
        }
    }
    return 1;
}
sub hangmanPic1
{
        print "  -------\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub hangmanPic2
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub hangmanPic3
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub hangmanPic4
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub hangmanPic5
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub hangmanPic6
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |     /\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
}

sub hangmanPic7
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |    / \\\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    print "You lost!\n";
    exit 0;
}