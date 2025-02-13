#!/bin/perl

while(<>){
  chomp;
  @field = split(/ +/);
  $ready = ($#field > 4) ? 2 : 1; # if namespace displayed Read is #2 field else #1
  $phase = 1+$ready;

  print "$_";
  if ($field[$phase] eq "Failed") {
    print "\t\t*!*"
  }
  elsif ($field[$phase] ne "Terminating" && $field[$phase] ne "Completed") {
    @r = split('/', $field[$ready]);
    print "\t\t|", "+" x $r[0], "-" x ($r[1]-$r[0]), "|";
  }
  print "\n";
}
