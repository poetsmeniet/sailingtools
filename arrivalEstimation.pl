#!/usr/bin/perl
#arrivalEstimation.pl
#Just a quick and dirty little tool for arrival time estimation
use Scalar::Util qw(looks_like_number);
use strict;
use warnings;

sub doCalculation{
    my $depTime = shift;
    my $nm = shift;
    my $avgKts = shift;

    my $nmPerDay = $avgKts * 24;
    my $tripTimeInHours = $nm / $avgKts;
    
    my $tripTimeInDays = $tripTimeInHours / 24;
    printf("part1: ".($tripTimeInHours % 24).", part2: ".($depTime - 24)."\n");
    my $arrivalTime = ($tripTimeInHours % 24) + ($depTime - 24);
    $arrivalTime = $arrivalTime % 24 if($arrivalTime < 0);
    $arrivalTime = 24 if($arrivalTime == 0);
    
    print("Departure: $depTime:00\n");
    print("nmPerDay: $nmPerDay\n");
    print("tripTimeInHours: $tripTimeInHours\n");
    print("tripTimeInDays: $tripTimeInDays\n");
    print("Arrival time: $arrivalTime:00\n");
}


my $nm;
my $avgKts;
my $depTime = 24;

while(!looks_like_number($nm)){
    print("Total trip nautical miles: ");
    $nm = <STDIN>;
}

while(1){
    print("\nEnter new departure time (whole 24 hr, def: $depTime): ");
    my $depTimeTmp = <STDIN>;
    if(looks_like_number($depTimeTmp)){
        $depTime = $depTimeTmp;
    }

    while(!looks_like_number($avgKts)){
        print("Avg kts: ");
        $avgKts = <STDIN>;
    }
    chomp($depTime, $avgKts);
    chomp($avgKts);
    
    &doCalculation($depTime, $nm, $avgKts, $depTime);

    $avgKts = "";
}
