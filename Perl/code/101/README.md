## **Perl 101**

### **Table of Contents**

- [What is Perl?](#what-is-perl)
- [101 Code Snippets](#101-code-snippets)
    - [Running Perl programs](#running-perl-programs)
    - [Stay Safe](#stay-safe)
    - [Basic Syntax](#basic-syntax)
    - [Variables](#variables)
        - [Scalars](#scalars)
        - [Arrays](#arrays)
        - [Hashes](#hashes)
    - [References](#references)
    - [Variable scope](#variable-scope)
    - [Conditionals and loops](#conditionals-and-loops)
    - [Built-in operators](#built-in-operators)
        - [Arithmetic operators](#arithmetic-operators)
        - [Numeric comparison operators](#numeric-comparison-operators)
        - [String comparison operators](#string-comparison-operators)
        - [Logical operators](#logical-operators)
    - [Miscellaneous operators](#miscellaneous-operators)
    - [Subroutines](#subroutines)
    - [File I/O](#file-io)
    - [Regular expressions](#regular-expressions)

### **What is Perl?**

Perl is a versatile programming language initially designed for text 
manipulation,
but now used for various tasks like system administration, web development,
network programming, GUI development, and more.

It's practical, easy to use, and supports both procedural and
object-oriented programming. Perl has robust built-in support for text
processing and a vast collection of third-party modules.

Different people use Perl in different ways, making it a language worth 
exploring.

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

```perl
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

```perl
#!/usr/bin/env perl
use strict;
use warnings;
```
`strict` and `warnings` check different things, so it's a good idea to use both.
The first one checks for common mistakes, and the second one warns you about
potential problems.

If you're lazy _and_ have Perl `5.35` or higher, you can kill two declarations
with one line:

```perl
use v5.35;
```
This turns on both `strict` and `warnings` by default.

#### **Basic Syntax**

Perl is a free-form language, which means that you can format your code however
you want. However, there are some conventions that you should follow to make
your code more readable (and maintainable).

Every statement in Perl ends with a semicolon (`;`).

```perl
print "Hello, World!";
```
Unless, it's a comment:

```perl
# This is just a comment in Perl. It's fine to end it with a period, though.
```

Perl doesn't care about whitespace, but you should.

```perl
print
    'Whitespace is important in Perl, 
    but not to Perl.';
;
```
Double quotes (`"`) and single quotes (`'`) are interchangeable, but there are
some differences. For example, double quotes interpolate variables, while single
quotes don't.

Also, _whitespace_ is _relevant_ when you use double quotes. :)

```perl
my $name = 'traveler';
print "Hello there, $name!\n"; # This works fine
print 'Hello there, $name!\n'; # This prints the literal string: $name\n
```

You can skip quotes when you want to print numbers:

```perl
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

```perl
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

```perl
# An example of $_ in action

while (<>) { # There's another special variable here: <>; but that's a story 
for another time.
    chomp;
    print "It was $_ that I saw!\n";
}
```

##### **Arrays**

`Arrays` are ordered lists of scalars. They're declared with the `@` 
[sigil](../../../GLOSSARY.md#sigil).

```perl
my @super_heros = ("Batman", "Superman", "Wonderwoman");
my @top_secret_numbers = (1, 2, 3, 4, 5);
my @some_random_stuff = ("forty six &two", 3.14, "the answer to life, the 
universe, and everything", 69);

# Arrays can be empty, too.
my @empty_array = ();

# You can also declare an array without any elements.
my @another_empty_array;

# You can access individual elements of an array by using the index.
# Note that the index starts at 0.
print $super_heros[0]; # Prints "Batman"
print $some_random_stuff[2]; # Prints "the answer to life, the universe, and 
everything"
print $top_secret_numbers[-1]; # Prints 5 (negative indices start from the end 
of the array)

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

```perl
# Note the % sigil and the use of whitespace for readability.
my %super_heroes = (
    "Batman" => "Bruce Wayne",
    "Superman" => "Clark Kent",
    "Wonderwoman" => "Diana Prince",
);

# This is how you get the value for a given key
print $super_heroes{"Wonderwoman"}; # Prints "Diana Prince"

# To get the list of keys, use the keys function
my @the_real_names = keys %super_heroes; # Returns ("Batman", "Superman", 
"Wonderwoman")

# To get the list of values, use the values function
my @the_super_heroes = values %super_heroes; # Returns ("Bruce Wayne", "Clark 
Kent", "Diana Prince")
```

There's a lot more on `scalars`, `arrays`, and `hashes` in the
[perldata](https://perldoc.perl.org/perldata) docs.

Of course, you can build more complex data structures by combining these three
types. For example, you can have an array of hashes, or a hash of arrays, or a
hash of hashes, or an array of arrays of hashes, or... you get the idea. :D

#### **References**

I guess it's a good moment to talk about references. A reference is a scalar
value that points to another value. Sort of like a pointer in C, but not quite.

```perl
my $book = "The Hitchhiker's Guide to the Galaxy";
my $book_ref = \$book; # This is a reference to the $book variable

# To get the value of the variable that the reference points to, you need to
# dereference it.
print $$book_ref; # Prints "The Hitchhiker's Guide to the Galaxy"
```

You can also create references to arrays and hashes:

```perl
my @books = ("Catch-22", "1984", "The Catcher in the Rye");
my $books_ref = \@books; # This is a reference to the @books array

my %titles_and_authors = (
    "Catch-22" => "Joseph Heller",
    "1984" => "George Orwell",
    "The Catcher in the Rye" => "J. D. Salinger",
);

my $titles_and_authors_ref = \%titles_and_authors; # This is a reference to the 
%titles_and_authors hash

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
- [perlreftut](https://perldoc.perl.org/perlreftut) Perl references short 
introduction
- [perlref](https://perldoc.perl.org/perlref) Perl references
- [perldsc](https://perldoc.perl.org/perldsc) Perl data structures intro
- [perllol](https://perldoc.perl.org/perllol) Perl data structures: arrays of 
arrays

Yes, there's an official doc in Perl that has `lol` in its name. :)

#### **Variable scope**

You might have noticed that I've been using the `my` keyword when declaring
variables. This is a good practice, and you should do it, too. It makes your
code more robust and easier to maintain.

However, you can also declare variables without `my`. But this creates a global
variable, and that's considered a bad programming practice. You should avoid
using global variables as much as possible. Using the `strict` pragma is one way
of making sure you don't accidentally create global variables.

Now, let's talk about the scope of variables. In Perl, there are three types of
scopes: `lexical`, `package`, and `file`.

```perl
# Lexical scope
my $lexical_variable = "I'm a lexical variable.";
my $condition = 1;
if ($condition) {
    my $another_lexical_variable = "I'm another lexical variable.";
    print $lexical_variable; # Prints "I'm a lexical variable."
    print $another_lexical_variable; # Prints "I'm another lexical variable."
}
print $lexical_variable; # Prints "I'm a lexical variable."
print $another_lexical_variable; # This won't work, because 
$another_lexical_variable is out of scope.
```
As for the `package` and `file` scopes, I'll cover them as I go.

#### **Conditionals and loops**
Perl offers a range of conditional statements, including `if`, `unless`, 
`while`, and
`until`. They're pretty much self-explanatory. But let's look at some examples.

```perl
if ($condition) {
    ...
} elsif ($another_condition) {
    ...
} else {
    ...
}
```
The _negated_ version of `if` is `unless`. It's a bit more readable in some 
cases. Most
notably, when you feel like using `if (!condition)`. 

```perl
unless ($condition) {
    ...
}
```
Note that you need the braces (`{}`) even if you have only one statement in the 
block. But...
you can _inline_ the conditional statement and make it more _Perlish_.

```perl
my $say_hi = 1;
print "Hi there!\n" if $say_hi; # Prints "Hi there!" if $say_hi is true
```

Let's talk `loops`, shall we?

The `for` loop is pretty much the same as in the good old `C`.

```perl
for (my $i = 0; $i < 10; $i++) {
    ...
}
```
But don't worry, if you're not a fan of the C-style `for` loop, Perl has you 
covered.
Say hello to `foreach`, a friendly and easy way to scan through an `array` or a 
`hash`.

```perl
my @array = (1, 2, 3, 4, 5);
for my $element (@array) {
    print $element;
}

# Same thing, but with a hash
my %hash = (
    "one" => 1,
    "two" => 2,
    "three" => 3,
);
for my $key (keys %hash) {
    print $key;
    print "And here's the value: $hash{$key}"
}
```

The `while` loop is pretty straightforward, too.

```perl
while ($condition) {
    ...
}
```
To flip the condition, use `until`.

```perl
until ($condition) {
    ...
}
```

#### **Built-in operators**

I'm going to run through some of the most common operators in Perl.

##### **Arithmetic operators**

```perl
+ # Addition
- # Subtraction
* # Multiplication
/ # Division
```
Nothing surprising here. But there's one thing you should know about division 
in Perl.
It's a bit different from other languages. In Perl, the `/` operator always 
returns
a floating-point number. If you want to get an integer, you need to use the 
`int`
function.

```perl
my $result = 6 / 2; # $result is 3.0
my $integer_result = int(6 / 2); # $integer_result is 3
```

##### **Numeric comparison operators**

```
== # Equality
!= # Inequality
<  # Less than
>  # Greater than
<= # Less than or equal to
>= # Greater than or equal to
```
Again, nothing surprising here. But you should be aware that comparing 
floating-point
numbers can be tricky due to their imprecise nature. You want to compare two
floating-point numbers and know if they’re equal when carried out to a certain
number of decimal places.

I'm not going to cover this, but here's a piece from the
[Perl 
Cookbook](https://www.oreilly.com/library/view/perl-cookbook/1565922433/ch02s03.
html)

##### **String comparison operators**

```
eq # Equality
ne # Inequality
lt # Less than
gt # Greater than
le # Less than or equal to
ge # Greater than or equal to
```
So, now, why are there two sets of comparison operators? Well, becasue there's 
no
special variable types in Perl. Everything is a scalar. Also, Perl needs to 
_know_
what you're comparing (or sorting). Is it a number or a string? That's why you
need to use different operators for different types.

##### **Logical operators**

Can't have a programming language without logical operators, right?

```
&& # Logical AND
|| # Logical OR
!  # Logical NOT
```
That's it. Nothing fancy here.

#### **Miscellaneous operators**

There are few more operators you should know about.

```
= # assignment
. # string concatenation
x # string repetition (e.g. "a" x 3 returns "aaa")
.. # range operator (e.g. 1..10 returns 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
```
As in `C`, you can combine assignment with arithmetic operators.

```perl
my $x = 1;
my $s = "Hello";

$x += 1; # $x is now 2
$x -= 1; # $x is 1 again

$s .= " there!"; # $s is now "Hello there!"
```

#### **Subroutines**

Subroutines are Perl's way of defining functions. They're declared with the 
`sub`
keyword. Writing subroutines is easy.

```perl
sub logger {
    my $message = shift;
    print "[$message]\n";
}
```

We just made ourselves a _very_ simple logger. Let's use it.

```perl
# Note: you can use the logger sub just like any other built-in function.
logger("Hello, World!"); # Prints "[Hello, World!]"
```

So, now you're probably wondering what's that `shift` thing. Well, it's a 
special
function that removes the first element of an array and returns it. If you don't
provide an array, it'll use `@_`, which is a special array that contains the
arguments passed to the subroutine.

In our little logger example, we're using `shift` to _shift_ the first item off
the list of arguments and assign it to the `$message` variable.

Subroutines can return values, too. Let's make a simple calculator.

```perl
sub add {
    my ($x, $y) = @_;
    return $x + $y;
}

# Then just use it like this:
my $result = add(1, 2);
print $result;
```

That's it for this 101. For more information on subroutines, check out the
official docs: [perlsub](https://perldoc.perl.org/perlsub).

#### **File I/O**
Let's do some simple file I/O. We'll start with reading a file.

```perl
# First, we need to open the file. The open function returns a filehandle.
# Note that we're using the lexical scope here.
my $filehandle;
my $filename = "some_file.txt";
open($filehandle, "<", $filename) or die "Can't open $filename: $!";
```

The `open` function takes three arguments: the filehandle, the mode, and the
filename. The mode can be `<` for reading, `>` for writing, or `>>` for 
appending.

We can read from an open filehandle using the `<>` (diamond) operator. In scalar
context it reads a single line, and in list context it reads all the lines.

```perl
my $line = <$filehandle>; # Reads a single line
my @lines = <$filehandle>; # Reads all the lines
```

Reading in a whole file at once is called _slurping_. It's a bit of a Perl
quirk, but it's useful in some cases. Other times, _slurping_ an entire file
can be a memory hog.

Most times, though, using the `<>` and a `while` loop is the way to go.

```perl
while (my $line = <$filehandle>) {
    # Do something with $line
}
```

This way, we're processing the file line by line, which is a lot more efficient.

When you're done reading from a file, you need to close it. Just between you and
me, if you forget to close a file, Perl will clean up after you.

```perl
close($filehandle) or die "Can't close $filename: $!";
```

#### **Regular expressions**

Perl's regular expression support is _legendary_. It's one of the things that
makes Perl so powerful and versatile. However, we're going to just gently touch
on the subject in this 101.

Perl's `regex` are both broad and deep. It's covered in more depth in the
following official docs:

- [perlrequick](https://perldoc.perl.org/perlrequick) Perl regular expressions 
quick start
- [perlretut](https://perldoc.perl.org/perlretut) Perl regular expressions 
tutorial

For now, let's just look at some basic examples. By the way, this is mostly
adapted from the [perlintro](https://perldoc.perl.org/perlintro) docs.

#### Simple matching:

```perl
if (/the thing I'm looking for/) { # True if $_ contains the thing
    print "Found it!\n";
}

if ($world =~ /the thing I'm looking for/) { # True if $world contains the thing
    print "Found it!\n";
}
```

The difference here between the matching operator `//` and the binding operator
`=~` is that the matching operator uses `$_` by default, while the binding
operator uses the variable on the left-hand side.

#### Simple substitution:

Same case here with the `//` and `=~` operators.

```perl
s/this/that/; # Replaces the first occurrence of "this" with "that" in $_
$foo =~ s/this/that/; # Replaces the first occurrence of "this" with "that" in 
$foo
$bar =~ s/this/that/g; # Replaces all occurrences of "this" with "that" in $bar
```

#### More complex stuff:

You don't just have to match on fixed strings. In fact, you can match on just 
about anything you could dream of by using more complex regular expressions. 
These are documented at great length in perlre, but for the meantime, here's a 
quick cheat sheet:

```
.                   a single character
\s                  a whitespace character (space, tab, newline,
                    ...)
\S                  non-whitespace character
\d                  a digit (0-9)
\D                  a non-digit
\w                  a word character (a-z, A-Z, 0-9, _)
\W                  a non-word character
[aeiou]             matches a single character in the given set
[^aeiou]            matches a single character outside the given
                    set
(foo|bar|baz)       matches any of the alternatives specified
```

```
^                   start of string
$                   end of string
Quantifiers can be used to specify how many of the previous thing you want to 
match on, where "thing" means either a literal character, one of the 
metacharacters listed above, or a group of characters or metacharacters in 
parentheses.

*                   zero or more of the previous thing
+                   one or more of the previous thing
?                   zero or one of the previous thing
{3}                 matches exactly 3 of the previous thing
{3,6}               matches between 3 and 6 of the previous thing
{3,}                matches 3 or more of the previous thing
Some brief examples:

/^\d+/              string starts with one or more digits
/^$/                nothing in the string (start and end are
                    adjacent)
/(\d\s){3}/         three digits, each followed by a whitespace
                    character (eg "3 4 5 ")
/(a.)+/             matches a string in which every odd-numbered
                    letter is a (eg "abacadaf")
```

```
# This loop reads from STDIN, and prints non-blank lines:
while (<>) {
    next if /^$/;
    print;
}
```

#### **That's it for now :D**

Well, if you've managed to get this far, I hope you've learned something new
about Perl. I know I did. :)
