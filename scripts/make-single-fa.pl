#!/usr/bin/perl
# $Id: make-single-fa.pl 255 2009-05-13 21:11:43Z briano $
# Takes a Genbank file, makes a fasta file from it

use strict;
use Bio::SeqIO;


my $gbk = shift or die "No Genbank file given";

my $dir = shift or die "No directory given";

my $in = Bio::SeqIO->new( -file => "$dir/$gbk",
								  -format => 'genbank' );

my ($genome) =  $gbk =~ /(\S+)\.gbk/;

my $out = Bio::SeqIO->new( -file => ">$genome.fa",
								   -format => 'fasta' );

my $seq = $in->next_seq;

$out->write_seq($seq);
