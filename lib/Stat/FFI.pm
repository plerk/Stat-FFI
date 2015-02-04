package Stat::FFI;

use strict;
use warnings;
use FFI::Platypus::Declare;

# ABSTRACT: FFI interface to stat function
# VERSION

custom_type stat => {
  native_to_perl => sub {
    bless \$_[0], 'Stat::FFI';
  },
  perl_to_native => sub {
    ${$_[0]};
  },
};

attach [ 'stat_new' => 'new' ],        ['string']          => stat   => '';
attach [ 'stat_st_dev' => 'st_dev' ],  ['stat'],           => dev_t  => '$';
attach [ 'stat_stat' => 'stat' ],      ['stat', 'string' ] => int    => '$$';
attach [ 'stat_delete' => 'DESTROY' ], ['stat'],           => void   => '$';

1;
