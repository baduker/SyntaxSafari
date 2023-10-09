## **Perl 101**

### **What is Perl?**

Perl is a versatile programming language initially designed for text manipulation,
but now used for various tasks like system administration, web development,
network programming, GUI development, and more.

It's practical, easy to use, and supports both procedural and
object-oriented programming. Perl has robust built-in support for text
processing and a vast collection of third-party modules.

Different people use Perl in different ways, making it a language worth exploring.

_The language is intended to be practical (easy to use, efficient, complete)
rather than beautiful (tiny, elegant, minimal)._

### **101 Code Snippets**

#### **Running Perl programs**

```bash
perl your_perl_script_name.pl
```
Oddly enough, I've seen scripts with the `.perl` extension, too.

Alternatively, you can run your script like this, providing that you've added
the shebang line at the top of your script:

```perl5
#!/usr/bin/env perl
```

Then, you can run your script like this:
```bash
./your_perl_script_name.pl
```

Note, you might have to `chmod` your script, first:
```bash
chmod +x your_perl_script_name.pl
```

#### **Stay Safe**

Perl, by default, lets you do things _your way_ and is very forgiving. However,
if you want to make sure your code is _robust_, you can use the following lines:

By the way, this is considered a best practice, and you'll see it in most Perl
scripts.

```perl5
#!/usr/bin/env perl
use strict;
use warnings;
```
`strict` and `warnings` check different things, so it's a good idea to use both.
The first one checks for common mistakes, and the second one warns you about
potential problems.

If you're lazy _and_ have Perl `5.35` or higher, you can kill two declarations
with one line:

```perl5
use v5.35;
```
This turns on both `strict` and `warnings` by default.

#### **Basic Syntax**

Perl is a free-form language, which means that you can format your code however
you want. However, there are some conventions that you should follow to make
your code more readable (and maintainable).

Every statement in Perl ends with a semicolon (`;`).

```perl5
print "Hello, World!";
```
Unless, it's a comment:

```perl5
# This is just a comment in Perl. It's fine to end it with a period, though.
```

Perl doesn't care about whitespace, but you should.

```perl5
print
    'Whitespace is important in Perl, 
    but not to Perl.';
;
```
Double quotes (`"`) and single quotes (`'`) are interchangeable, but there are
some differences. For example, double quotes interpolate variables, while single
quotes don't.

Also, _whitespace_ is _relevant_ when you use double quotes. :)

```perl5
my $name = 'traveler';
print "Hello there, $name!\n"; # This works fine
print 'Hello there, $name!\n'; # This prints the literal string: $name\n
```

You can skip quotes when you want to print numbers:

```perl5
print 462;
```

#### **Variables**

Perl has three types of variables: `scalars`, `arrays`, and `hashes`.

##### **Scalars**

The _Lama Book_ says that _Perl's data types are simple. A `scalar` is a single
thing. That's it._

`Scalars` are the simplest kind of data in Perl. They can be strings or numbers
(both integers and floating-point numbers). Perl will figure out the type for
you and convert between types as needed.

```perl5
# You need to use the `my` keyword to declare a variable.
# Otherwise, it's a global variable, and that's not a good thing.
# Also, the `strict` pragma will complain about it.

my $super_hero = 'Batman';
my $villain_count = 1;
print "$super_hero has defeated $villain_count villain.\n";
```

Perl defines a bunch of special `scalars` that have short and cryptic names.
One of the most well-known ones is `$_`, which is used as a default variable.
These variables come in handy in all kinds of situations, and you'll see them a
lot in Perl code.

I won't cover them in this 101, as that'd be a bit too much of a bite. But feel
free to check them out in the [perlvar](https://perldoc.perl.org/perlvar) docs.

```perl5
# An example of $_ in action

while (<>) { # There's another special variable here: <>; but that's a story for another time.
    chomp;
    print "It was $_ that I saw!\n";
}
```

##### **Arrays**

`Arrays` are ordered lists of scalars. They're declared with the `@` [sigil](../../../GLOSSARY.md#sigil).

```perl5
my @super_heros = ("Batman", "Superman", "Wonderwoman");
my @top_secret_numbers = (1, 2, 3, 4, 5);
my @some_random_stuff = ("forty six &two", 3.14, "the answer to life, the universe, and everything", 69);

# Arrays can be empty, too.
my @empty_array = ();

# You can also declare an array without any elements.
my @another_empty_array;

# You can access individual elements of an array by using the index.
# Note that the index starts at 0.
print $super_heros[0]; # Prints "Batman"
print $some_random_stuff[2]; # Prints "the answer to life, the universe, and everything"
print $top_secret_numbers[-1]; # Prints 5 (negative indices start from the end of the array)

# Get the length of an array
print scalar @super_heros; # Prints 3

# You can use this within a conditional to check if an array is empty
if (@empty_array) {
    print "This won't print, because the array is empty.\n";
}

# Get the last index of an array
print $#super_heros; # Prints 2

# I hope you've noticed that I'm using the `$` sigil when accessing individual
# elements of an array. This is called "scalar context", and it's a bit of a
# quirk in Perl. I'll cover it in more detail later.

# Last thing: have you ever wondered where Python slices came from? Well, now
# you know. Looks like Perl had them first. :)

@some_random_stuff[0..1]; # Returns ("forty six &two", 3.14)
@top_secret_numbers[1..$#top_secret_numbers]; # Returns all but the first one

# Some other useful stuff you can do with arrays

my @sorted_numbers = sort @top_secret_numbers; # Sorts the array
my @answers_backwards = reverse @some_random_stuff; # Reverses the array
```

##### **Hashes**
A `hash` is an unordered collection of key/value pairs. Sort of like Python's
dictionary or JavaScript's object.

```perl5
# Note the % sigil and the use of whitespace for readability.
my %super_heroes = (
    "Batman" => "Bruce Wayne",
    "Superman" => "Clark Kent",
    "Wonderwoman" => "Diana Prince",
);

# This is how you get the value for a given key
print $super_heroes{"Wonderwoman"}; # Prints "Diana Prince"

# To get the list of keys, use the keys function
my @the_real_names = keys %super_heroes; # Returns ("Batman", "Superman", "Wonderwoman")

# To get the list of values, use the values function
my @the_super_heroes = values %super_heroes; # Returns ("Bruce Wayne", "Clark Kent", "Diana Prince")
```

There's a lot more on `scalars`, `arrays`, and `hashes` in the
[perldata](https://perldoc.perl.org/perldata) docs.

Of course, you can build more complex data structures by combining these three
types. For example, you can have an array of hashes, or a hash of arrays, or a
hash of hashes, or an array of arrays of hashes, or... you get the idea. :D

#### **References**

I guess it's a good moment to talk about references. A reference is a scalar
value that points to another value. Sort of like a pointer in C, but not quite.

```perl5
my $book = "The Hitchhiker's Guide to the Galaxy";
my $book_ref = \$book; # This is a reference to the $book variable

# To get the value of the variable that the reference points to, you need to
# dereference it.
print $$book_ref; # Prints "The Hitchhiker's Guide to the Galaxy"
```

You can also create references to arrays and hashes:

```perl5
my @books = ("Catch-22", "1984", "The Catcher in the Rye");
my $books_ref = \@books; # This is a reference to the @books array

my %titles_and_authors = (
    "Catch-22" => "Joseph Heller",
    "1984" => "George Orwell",
    "The Catcher in the Rye" => "J. D. Salinger",
);

my $titles_and_authors_ref = \%titles_and_authors; # This is a reference to the %titles_and_authors hash

# Now, some funky Perl magic. You can use the arrow operator to dereference.
print $titles_and_authors_ref->{"Catch-22"}; # Prints "Joseph Heller"

# Knowing all this gives some some powerful tools to work with complex data
# structures. For example, you can have a two-level hash like this:

my %books = (
    "Catch-22" => {
        "author" => "Joseph Heller",
        "year" => 1961,
    },
    "1984" => {
        "author" => "George Orwell",
        "year" => 1949,
    },
    "The Catcher in the Rye" => {
        "author" => "J. D. Salinger",
        "year" => 1951,
    },
);

# And you can access it like this:
print $books{"Catch-22"}{"author"}; # Prints "Joseph Heller"

# And yes, you can mix them up and have a, say, a hash of arrays of hashes.
# But that's a bit too much for this 101. :)
```

The Books of Spells for complex data structures are as follows:
- [perlreftut](https://perldoc.perl.org/perlreftut) Perl references short introduction
- [perlref](https://perldoc.perl.org/perlref) Perl references
- [perldsc](https://perldoc.perl.org/perldsc) Perl data structures intro
- [perllol](https://perldoc.perl.org/perllol) Perl data structures: arrays of arrays

Yes, there's an official doc in Perl that has `lol` in its name. :)
