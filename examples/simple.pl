#!/usr/bin/perl

=encoding UTF-8
=cut

=head1 Описание

=cut

# common modules
use strict;
use warnings FATAL => 'all';
use 5.010;
use DDP;
use Carp;
use lib::abs qw(../lib);

use Math::Set;

# global vars

# subs

# main
sub main {

    my $empty_set = Math::Set->new();
    $empty_set->print;


    my $empty_set_with_name = Math::Set->new(
        name => 'E',
    );
    $empty_set_with_name->print;


    my $some_set = Math::Set->new(
        name => "D",
        members => [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
            "Saturday", "Sunday" ],
    );
    $some_set->print;

    my $the_other_set = Math::Set->new(
        members => [ -1..3 ],
    );
    $the_other_set->print;


    say '#END';
}

main();
__END__
