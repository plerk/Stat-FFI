package Stat::FFI;

use strict;
use warnings;
use FFI::Platypus::Declare;
use FFI::Util qw( locate_module_share_lib );

# ABSTRACT: FFI interface to stat function
# VERSION

lib do {
  # fetch location of Stat/FFI.so created 
  # by Module::Build::FFI at install
  my $file = locate_module_share_lib();
  $file;
};

custom_type opaque => stat => {
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
