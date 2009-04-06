use strict;
use Test::Base;

use lib qw(../lib);

filters {
    i => [qw/chomp orig_method/],
    e => [qw/chomp/],
};

sub orig_method {}

run_is i => 'e';

