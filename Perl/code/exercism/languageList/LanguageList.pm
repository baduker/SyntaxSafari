package LanguageList;

use v5.38;

our @Languages;

sub add_language ($language) {
    push @Languages, $language
}

sub remove_language () {
    pop @Languages
}

sub first_language () {
    $Languages[0]
}

sub last_language () {
    $Languages[-1]
}

sub get_languages (@elements) {
    # The -- is a decrement operator, so essentially this command is decreasing
    # the value of each element in @elements by 1
    # The $_ is, of course, the default variable in Perl! :-)
    $_-- foreach @elements;
    @Languages[@elements]
}

sub has_language ($language) {
    # The grep function returns a list of all elements in @Languages that
    # satisfy the condition in the block
    grep { $language eq $_ } @Languages
}
