### **Day 1: October 1st, 2023**

So, I've rolled the (pseudo-random) dice, and it looks like we've got Perl for
my first stop on the safari.

I've never really used Perl beyond a few one-liners here and there, so I'm
excited to see what it's all about.

Also, I've heard that Perl is a bit of a "write-only" language, so I'm curious
to see if that's true.
And some even say that Perl's dead. Well, I'm not so sure about that. I guess
we'll find out soon enough.

In the first couple of days, I'm going to focus on getting a feel for the 
language
and its ecosystem. I'll be reading the official docs, checking out some 
tutorials,
researching some best practices, and maybe even reading a book or two.


### **Day 2: October 2nd, 2023**

Today, I mostly did some reading and research. I started with the Wikipedia 
page,
bookmarked a couple of resources for later, and picked up a copy of the famous
["Lama 
Book"](https://www.amazon.com/Learning-Perl-Making-Things-Possible/dp/1491954329
)

I also added the first couple of entries in the [GLOSSARY](../GLOSSARY.md).
Turned out, I had to move it to the root directory, because it's going to be
shared by all the languages, and it takes some amount of dexterity to keep
typing _Miscellaneous_ correctly.

What I didn't do today was actually compile a selection of resources.

### **Day 3: October 3rd, 2023**

Compiled a list of resources. See [RESOURCES](./RESOURCES.md).

Now, I need to go through the list and pick a couple of resources to start with.

### **Day 4: October 4th, 2023**

I've decided to start with the official Perl docs. So far, I've been reading
mostly what's in the [Perldoc](https://perldoc.perl.org/perl#Overview) section.

Turns out, writing about a programming langauge can be engaging and fun - that's
how I can summarize my experience with the official Perl docs so far. 

So far, I've covered:

- [`perlintro`](https://perldoc.perl.org/perlintro) Perl introduction for 
beginners
- [`perldsc`](https://perldoc.perl.org/perldsc) Perl data structures intro
- [`perllol`](https://perldoc.perl.org/perllol) Perl data structures: arrays of 
arrays
- [`perlreftut`](https://perldoc.perl.org/perlreftut) Perl references short 
introduction
- [`perlstyle`](https://perldoc.perl.org/perlstyle) Perl style guide

I'd like to use these docs as the base for a code-like introduction to Perl.

### **Day 5: October 5th, 2023**

Sadly, I didn't get to do much today. I did, however, manage to read a couple of
pages from the "Lama Book" and the 
[perldoc](https://perldoc.perl.org/perl#Overview)

I'll try to catch up tomorrow.

### **Day 6: October 6th, 2023**

I was mostly going (still!) through the 
[perldoc](https://perldoc.perl.org/perl#Overview)
and the "Lama Book".

### **Day 7: October 7th, 2023**

No work done. :(

### **Day 8: October 8th, 2023**

Got a draft of my 101-style introduction to Perl based on what I've leared from
the [perldoc](https://perldoc.perl.org/perl#Overview) and the "Lama Book".

### **Day 9: October 9th, 2023**

Wrote the first part of the 101-style introduction to Perl. See 
[Perl/101](./101/README.md).
I covered the following topics:
- Perl short intro
- Pragmas
- Comments
- Variables
- Scalars
- Arrays
- Hashes
- References

More to come tomorrow!

### **Day 10: October 10th, 2023**

Wrote the second part of the 101-style introduction to Perl. See 
[Perl/101](./101/README.md).
I added:
- Variable scope
- Conditional statements
- Loops
- Operators

Tomorrow, I'd like to cover subroutines and touch on regular expressions and 
maybe
some `I/O`.

### **Day 11: October 11th, 2023**

I guess I can say I'm done with the 101 thingy. Manged to round it up with
subroutines, regular expressions, and `I/O`. See [Perl/101](./101/README.md).

It's time to get my hands dirty with some actual code. I don't know what I'm
going to start with yet, but I'll figure it out tomorrow.

### **Day 12 - 20: October 12th - 20th, 2023**

Well, if there's anything that I _really_ learned so far it has nothing to do
with codding. Turns out that it's pretty hard to keep up with a daily schedule
when you have a full-time job, a side project, you contribute to open-source,
and have a family trip spanning over a week. Who would've thought?

Anyway, I'm back on track now. I've decided to start with the
[Exercism](https://exercism.org/tracks/perl5) and for the next couple of days
I'll be working on the exercises there. I'll post my solutions in the code
section of this repo.

Also, there's a slight change when it comes to the schedule. I won't start with
a new language every month. Instead, I'll be spending a month on each language.

That way, I'll have more time to explore each language, and I'll be able to
focus on other things as well. I guess I was a bit too ambitious with the
original plan.

It's hard to do all the stuff _and_ learn and write about a new language every
day on top of that. I'm not a robot, you know. 🤖

### **Day 21: November 1st, 2023**

I am failing miserably at this. There has been so much happening in the last
couple of weeks that I didn't have time to do anything. I'm going to try to
catch up in the next couple of days.

But out of curiosity, I've decided to check what next language I might be
learning. And it looks like it's going to be the good, old *C*!

### **Day 22: November 3rd, 2023**

I've done it! My first Perl script is here!

Today's coding session was all about making life a bit easier when it comes to 
file management. After spending what seemed like an eternity last week manually 
renaming a batch of PDFs, I decided it was time to automate the process. Hence, 
my latest creation: the Perl script [renamer](./code/renamer).

The `renamer` utility is a nifty piece of software that I’ve written to 
automate the sanitization of file names, particularly targeting unwanted 
characters such as spaces, commas, dots, and dashes. It's tailored to deal with 
my extensive collection of PDFs which, due to some quirk in the scanning 
software I use, always come out with file names that look like a cat walked 
over the keyboard.

What's cool about it is the simplicity of use. Just a single command and it 
cleans up an entire directory of files, which is a godsend for my 
organizational needs. The script allows for customization too; I can specify 
what character to use as a replacement for those it strips out, and even change 
the file extension it targets.

Today, I watched it effortlessly rename files in my documents directory, 
swapping out various unwanted characters for underscores by default, or 
whatever I told it to use. There's a certain kind of magic in watching a script 
go to work on a task that would otherwise be mind-numbingly tedious.

However, perfection is a journey, not a destination. There are a couple of 
improvements I want to make to the script:

1. **Hidden Directories:** The script currently does not skip hidden 
directories. While this wasn't an issue in my use case, it could cause 
unexpected behavior for others. Implementing a check to skip these would make 
the script more robust.

2. **Total Files Count:** It would be useful to have a summary of how many 
files were renamed after the script completes its run. This feedback would 
provide immediate confirmation of the script's effectiveness.

3. **Upward Directory Path Handling:** There’s a TODO comment in the code about 
handling upward directory paths (like `../dir`). This needs to be addressed to 
prevent the script from potentially escaping the intended directory scope.

4. **Error Handling:** While there's some basic error handling in place, it's 
somewhat rudimentary. I should expand this to catch more specific file system 
errors and handle them gracefully.

5. **Efficiency:** Currently, the script processes files one by one. This might 
not scale well for directories with thousands of files. Some form of batching 
or parallel processing could be introduced to speed things up.

6. **Logging:** Instead of just printing to STDOUT, it might be better to have 
an option to log the changes to a file for record-keeping.

7. **User Experience:** While command line tools are second nature to me, I 
know that's not the case for everyone. Down the line, a simple GUI wrapper 
could make the utility even more accessible.

Overall, I'm quite pleased with today's progress. The `renamer` script is 
already saving time and reducing hassle, and with a bit more work, it could 
become an indispensable tool in my software arsenal.

Until next time!

Hopefully it's not going to be in another two weeks. 🤞
