use strict;
use warnings;
use Test::More tests => 4;
use Stat::FFI;

my $stat = Stat::FFI->new;

isa_ok $stat, 'Stat::FFI';

is $stat->stat('bogus'), -1, 'called stat on bogus';
is $stat->stat(__FILE__), 0, 'called stat on ' . __FILE__;

my $expected = (stat __FILE__)[0];
is $stat->st_dev, $expected, "expected dev ($expected)";
