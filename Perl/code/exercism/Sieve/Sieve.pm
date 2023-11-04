package Sieve;

# Enforce the use of Perl version 5.38 or newer
use v5.38;

# Use strict and warnings for safer code and to catch potential errors
use strict;
use warnings;

# Import the Exporter module to enable exporting of the find_primes function
use Exporter 'import';
# Declare the find_primes function as exportable on request
our @EXPORT_OK = qw(find_primes);

# Define the find_primes subroutine
sub find_primes {
    # Accept a single argument: the upper limit for finding prime numbers
    my ($limit) = @_;

    # If the limit is less than 2 (the first prime number), return an empty list
    return [] if $limit < 2;

    # Initialize the sieve with false (0) for indices 0 and 1,
    # and true (1) for all others
    my @sieve = (0, 0, (1) x ($limit - 1));

    # Start the Sieve of Eratosthenes algorithm
    # Only iterate up to the square root of the limit because a larger factor
    # would have a smaller partner that has been checked already
    for my $number (2 .. int(sqrt($limit))) {
        # If the current number hasn't been marked as non-prime, it is prime
        if ($sieve[$number]) {
            # Mark all multiples of the current prime number as non-prime
            for (my $multiple = $number**2; $multiple <= $limit; $multiple += $number) {
                $sieve[$multiple] = 0;
            }
        }
    }

    # Extract the prime numbers: get all indices that are still true (1) in the sieve
    # These indices correspond to prime numbers
    my @primes = grep { $sieve[$_] } 2 .. $limit;

    # Return a reference to the list of prime numbers
    return \@primes;
}
