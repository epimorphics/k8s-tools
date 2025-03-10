#!/bin/perl

while(<>){
  chomp;
  @field = split(/ +/);
  $ready = ($#field > 4) ? 2 : 1; # if namespace displayed Read is #2 field else #1
  $phase = 1+$ready;

  if ($field[$phase] ne "Terminating") {
    $a = $b = " ";
    $l = "|";
    $a = $b = $l = "*" if ($field[$phase] eq "Failed" || $field[$phase] eq "Error");
    $a = $b = "~" if ($field[$phase] eq "PodInitializing");
    $a = $b = "." if ($field[$phase] eq "Pending");
    $a = $b = "-" if ($field[$phase] eq "ContainerCreating");
    $a = "=" if ($field[$phase] eq "Running");
    $b = ">" if ($field[$phase] eq "Running");
    $a = $b = "/" if ($field[$phase] eq "Completed");
    @r = split('/', $field[$ready]);
    $s = sprintf("%s%s%s%s", $l, $a x $r[0], $b x ($r[1]-$r[0]), $l);
    printf("%-12s %s\n", $s, $_);
  }
  else {
    printf("%-12s %s\n", "", $_);
  }
}
