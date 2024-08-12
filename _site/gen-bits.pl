#!/usr/bin/perl

=head1 NAME

gen-bits.pl - Generates a set of html pages to display random bits of thoughts (i.e. tweets)
=head1 SYNOPSIS

Default Usage: 

=head1 AUTHORS

zakuarbor (Ju Hong Kim)

=cut

use strict;
use warnings;
use File::Basename;

my $BITS_DIR = "bits";
my $TEMPLATE_DIR = "templates";
my @files = ();

`cat ${TEMPLATE_DIR}/header.html > index.html`;

open(FH, ">>", "index.html" ) || die "Can't open index.html: $!";

print FH "<div id = 'content'>";
my $num = 0;
opendir(DIRHANDLE, ${BITS_DIR}) || die "Cannot opendir bits: $!";
foreach my $fname (reverse sort readdir(DIRHANDLE)) {
  if ($fname !~ /^20\d\d-\d\d-\d\d/) {
    next;
  }
  my $file = "${BITS_DIR}/${fname}";
  my $meta = `head -n 5 $file`;
  if ($meta !~ /publish:\s?1/) {
    next;
  }
  if ($num != 0) {
    print FH "<hr class = 'bits-hr'/>";
  }
  
  my ($title) = $meta =~ m/title:\s?(.*)/;
  my ($date) = $meta =~ m/date:\s?(20\d\d-\d\d-\d\d)/;
  print "found file: ${fname} - ${title} - $date\n";
  print FH "<div class = 'bits'>";
  print FH "<h2 class = 'title'>${title}</h2>";
  print FH "<p class = 'date'>${date}</p>";
  print FH `tail -n +7 ${file}`;
  print FH "</div>";
  $num++;
}
closedir(DIRHANDLE);
print FH "</div>";
close FH or warn "Failed to close index.html";

`cat ${TEMPLATE_DIR}/footer.html >> index.html`
