package Math::Set;

use warnings;
use strict;

use Scalar::Util qw(looks_like_number);
use Carp;

=head1 NAME

Math::Set - some experiments with the mathematical sets

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

my $empty_set_symbol = "∅";

=head1 SYNOPSIS

=head2 Example 1

    my $empty_set = Math::Set->new();
    $empty_set->print;

Output:

    ∅

=head2 Example 2

    my $empty_set_with_name = Math::Set->new(
        name => 'E',
    );
    $empty_set_with_name->print;

Output:

    E = ∅

=head2 Example 3

    my $some_set = Math::Set->new(
        name => "D",
        members => [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday",
            "Saturday", "Sunday" ],
    );
    $some_set->print;

Output:

    D = { Friday Monday Saturday Sunday Thursday Tuesday Wednesday }

=head2 Example 4

    my $the_other_set = Math::Set->new(
        members => [ -1..3 ],
    );
    $the_other_set->print;

Output:

    { -1 0 1 2 3 }

=head1 METHODS

=head2 new

=cut

sub new {
    my ($class, %params) = @_;

    my $self = {
        _members => {},
    };

    bless $self, $class;

    if (defined $params{name}) {
        if (ref $params{name} eq "") {
            $self->{_name} = $params{name};
        } else {
            croak "Expecting parameter 'name' to be string. Stopped"
        }
    }

    if (defined $params{members}) {
        if (ref $params{members} eq "ARRAY") {
            foreach my $element (@{$params{members}}) {
                if (ref $element eq "") {
                    if (not defined $self->{_members}->{$element}) {
                        $self->{_members}->{$element} = 1;
                    } else {
                        croak "Member '$element' exists in the set declaration more than once. It is incorrect. Stopped"
                    }

                } else {
                    croak "Expecting member to be string. Stopped"
                }

            }
        } else {
            croak "Expecting parameter 'members' to be array. Stopped"
        }
    }

    return $self;
}

sub print {
    my ($self) = @_;

    if (defined $self->{_name}) {
        print $self->{_name} . " = ";
    }

    if (%{$self->{_members}}) {
        print "{ ";
        foreach my $member (sort { if (looks_like_number($a) and looks_like_number($b)) { $a <=> $b } else { $a cmp $b } } keys %{$self->{_members}}) {
            print $member . " ";
        }
        print "}\n";
    } else {
        print $empty_set_symbol . "\n";
    }

}

=head1 AUTHOR

Ivan Bessarabov, C<< <ivan at bessarabov.ru> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-math-set at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Math-Set>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Math::Set


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Math-Set>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Math-Set>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Math-Set>

=item * Search CPAN

L<http://search.cpan.org/dist/Math-Set/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Ivan Bessarabov.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;
