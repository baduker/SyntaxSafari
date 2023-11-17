## **An Opinionated List of Perl Resources**

- https://www.perl.org/ - The official Perl website.
- https://learn.perl.org/ - This, at a first glance, looks like a great
place to start learning Perl. It has a bunch of links to tutorials, books, and
other resources. I, particularly, like the
[free online book section](https://www.perl.org/books/library.html).
- [Perldoc](https://perldoc.perl.org/perl#Overview) - The official Perl docs. A
trove of information. I have a feeling I'll be using this a lot!
- [Learn X in Y minutes Where X=Perl](https://learnxinyminutes.com/docs/perl/) -
A quick overview of Perl syntax and features. I've never used this site before,
but I really like it. It's a great way to get a quick overview of a language.
I'll use it as a reference as I go.
- [Perl on Exercism](https://exercism.org/tracks/perl5) - I've used Exercism for
other languages, mostly Python and Go, and I really like it. It's a great way to
get the feel for a language through a series of small, self-contained exercises.
- [Perl 
One-Liners](https://learnbyexample.github.io/learn_perl_oneliners/cover.html) -
Here's a nice little book on Perl one-liners, I've stumbled upon. Looks like a
pretty good source of inspiration if you're dealing with text processing.
- [Why Perl?](https://two-wrongs.com/why-perl.html) - A blog article in which
the author explains why they use Perl for quick prototyping and scripting. They 
list some advantages of Perl, such as ubiquity, scalability, longevity, 
simplicity, and extensibility.
- [Perl on Stackoverflow](https://stackoverflow.com/questions/tagged/perl?tab=Votes) -
A list of the most popular Perl questions on Stackoverflow. A trove of Perl
programming knowledge.

### Quirks and Oddities

- Turns out there used to be a German (!)
[Perl magazine](https://www.perl-magazin.de/) called `$foo`. It was discontinued
in 2014 though. I've never heard of a programming language having its own
periodical. I wonder if there are any others out there.
- The source code for Perl is available 
[here](https://www.cpan.org/src/README.html).
There's nothing hilarious about the code itself, but what I found interesting is
the footnote at the bottom of the page:
_Yours Eclectically, The Self-Appointed Master Librarians (OOK!) of the CPAN._
These Perl people sure have a sense of humor!

### Installation

Here's how I did it:

```bash
brew install perl
```

Then, I ran `perl --version` to make sure everything was installed correctly.

I usually do most of my work in a JetBrains IDE, so I also had to configure
Perl there. I'm using the perl version that I installed with Homebrew, so I
just had to point the IDE to the right location.

```bash
which perl
```

In my case, the output was `/opt/homebrew/bin/perl`.

Also, it's recommended to have `perlcritic` installed.

```bash
cpan Perl::Critic
```

However, neither my shell nor my IDE picks up the `perlcritic` binary
automatically. In order to fix this, I had to come up with a workaround:

```bash
perl -V:installsitebin
```

And then, using the output, use the current perl binary that's installed on my
macOS.

```bash
export PATH=$PATH:/opt/homebrew/Cellar/perl/<YOUR_VERSION_OF_PERL>/bin/
```

This, fixed it for me.

Here's how you can do it, if your not on macOS:

[Get Perl on your machine](https://www.perl.org/get.html)
