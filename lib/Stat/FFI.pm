package Stat::FFI;

use strict;
use warnings;
use FFI::Platypus::Declare;

# ABSTRACT: FFI interface to stat function
# VERSION

=head1 SYNOPSIS

 use Stat::FFI;
 
 my $stat = Stat::FFI->new;
 $stat->stat('file.txt');
 my $st_dev = $stat->st_dev;

=head1 DESCRIPTION

This module provides an (incomplete) interface to the stat
record used to provide meta data about files in Unix like
operating systems.

It is not a useful module, since Perl has its own built in
implementation of L<stat|perlfunc#stat>, but is intended
to demonstrate capability of L<FFI::Platypus> and
L<Module::Build::FFI>.

=head1 CONSTRUCTOR

=head2 new

 my $stat = Stat::FFI->new;

Create a new instance of the stat object.

=head1 METHODS

=head2 st_dev

 my $st_dev = $stat->st_dev;

Get the st_dev attribute.

=head2 stat

 $stat->stat($filename);

Queries the operating system to get the meta data for the
given file.

=head1 SEE ALSO

=over 4

=item L<FFI::Platypus>

=item L<Module::Build::FFI>

=back

=cut

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
