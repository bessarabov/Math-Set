#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Math::Set' ) || print "Bail out!
";
}

diag( "Testing Math::Set $Math::Set::VERSION, Perl $], $^X" );
