package Stat::FFI;

use strict;
use warnings;
use base qw( FFI::Raw::Ptr );
use FFI::Sweet;
use FFI::Util qw( _dev_t locate_module_share_lib );

# ABSTRACT: FFI interface to stat function
# VERSION

ffi_lib do {
  my $file = locate_module_share_lib();
  \$file;
};

attach_function [ 'stat_new' => 'new' ], [], _ptr, sub { bless \(shift->()) };
attach_function [ 'stat_st_dev' => 'st_dev' ], [ _ptr ], _dev_t;
attach_function [ 'stat_stat' => 'stat' ], [ _ptr, _str ], _int;
attach_function [ 'stat_delete' => 'DESTROY' ], [ _ptr ], _void;

1;
