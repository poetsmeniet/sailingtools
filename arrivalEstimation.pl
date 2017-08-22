#!/usr/bin/perl
#arrivalEstimation.pl
#Just a quick and dirty little tool for arrival time estimation
use strict;
use warnings;

sub doCalculation{
    my $nm = shift;
    my $avgKts = shift;
    my $depTime = shift;

    my $nmPerDay = $avgKts * 24;
    my $tripTimeInHours = $nm / $avgKts;
    
    my $tripTimeInDays = $tripTimeInHours / 24;
    my $arrivalTime = ($tripTimeInHours % 24) - (24 - $depTime);
    
    print("nmPerDay: $nmPerDay\n");
    print("tripTimeInHours: $tripTimeInHours\n");
    print("tripTimeInDays: $tripTimeInDays\n");
    print("Arrival time: $arrivalTime:00\n");
}


my $nm = 165;
my $avgKts = 5;
my $depTime = 20;

print("Total tip nautical miles: ");
$nm = <STDIN>;

while(1){
    print("\nEnter new departure time (whole 24 hr): ");
    $depTime = <STDIN>;
    print("Avg kts: ");
    $avgKts = <STDIN>;
    chomp($depTime, $avgKts);
    chomp($avgKts);
    &doCalculation($nm, $avgKts, $depTime);
}
