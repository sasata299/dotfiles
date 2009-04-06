#!/usr/bin/perl

use strict;
use warnings;
use File::MMagic;
use CGI;
use CGI::Carp qw(fatalsToBrowser);
use Data::Dumper;

main();

sub main {
    #my $file = 'ファイル名';
    #my $type = File::MMagic->new->checktype_filename($file);

    my $q = CGI->new;
    print $q->header();
    #print $q->header(
    #    -type => $type,
    #    -attachment => '社長.jpg', # ダウンロードするファイル名
    #);
}
