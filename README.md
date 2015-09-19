# Stat::FFI

FFI interface to stat function

# SYNOPSIS

    use Stat::FFI;
    
    my $stat = Stat::FFI->new;
    $stat->stat('file.txt');
    my $st_dev = $stat->st_dev;

# DESCRIPTION

This module provides an (incomplete) interface to the stat
record used to provide meta data about files in Unix like
operating systems.

It is not a useful module, since Perl has its own built in
implementation of [stat](https://metacpan.org/pod/perlfunc#stat), but is intended
to demonstrate capability of [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus) and
[Module::Build::FFI](https://metacpan.org/pod/Module::Build::FFI).

# CONSTRUCTOR

## new

    my $stat = Stat::FFI->new;

Create a new instance of the stat object.

# METHODS

## st\_dev

    my $st_dev = $stat->st_dev;

Get the st\_dev attribute.

## stat

    $stat->stat($filename);

Queries the operating system to get the meta data for the
given file.

# SEE ALSO

- [FFI::Platypus](https://metacpan.org/pod/FFI::Platypus)
- [Module::Build::FFI](https://metacpan.org/pod/Module::Build::FFI)

# AUTHOR

Graham Ollis &lt;plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
