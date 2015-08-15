# Practical tips for preparing your raw data for analysis

Data analysis is a central task in the workflow of data scientists,
researchers, software engineers, business analysts, and just about every
professional who needs to work with data. The first mundane step in data
analysis is *preparing raw data*, which originate from a diverse variety
of sources such as:

- logs from a Web server
- outputs from a specialized scientific instrument
- exported data from an online survey
- data dump from a 1970s government database
- reports prepared by external consultants

What all of these sources of raw data have in common is that **you have
absolutely no control over their format or quirks**. You need to work
with what you've been given, which is often:

- incomplete (not all fields are present in all records)
- inconsistent (field names and schemas change throughout the data set)
- corrupted (some records are malformed in weird ways)

Thus, you must often write computer programs to parse the raw data and
transform it into a form that's more friendly for analysis. This
often-unglamorous chore is sometimes called *data munging* or *data
wrangling*. In certain domains, you can use specialized tools to ease
this process; but if you don't have access to those tools, or your needs
are more complex, then you'll need to write your own parser.

This chapter presents some practical tips for writing reliable and
effective data parsers. These tips can be implemented in any
programming language (e.g., Perl, Python, R).


### Use assertions like there's no tomorrow

Here is the most important tip: assert the heck out of your parsing
code. Write down every assumption you have about the data's format in
the form of assertions, and then revise those assertions as you find out
which parts of the data inevitably violate them.

For instance, should all records be in chronological order? If so,
assert it! Should there be exactly seven fields per record? If so,
assert it! Should the first field always be an even integer between 0
and 26? If so, assert it!

In a perfect world, all records would be cleanly-formatted and abide by
an elegant and fixed schema. Not so in the real world!

Write assertions until your eyes bleed. Then write some more.

If you write good assertions, your parsing code *will crash a lot*.
That's great, since every crash (due to assertion failure) means that
you've just discovered one more way in which the raw data violated your
original assumptions. Keep refining your assertions until your code
successfully parses the entire raw data set. But keep them as stringent
as possible, or else they aren't doing their job. The worst-case outcome
is data sneaking through your parser in a format that you didn't expect.


### Print information about broken records

Some records in the raw data will be broken in unfixable ways, so your
program has no choice but to skip over them when parsing. A bad idea is to simply
skip them silently, since you won't know what data you're missing.
Instead, always:

- print a warning to stderr along with the raw record itself so that you
  can inspect it later to find out what's wrong.

- keep a running count of how many records your program has skipped so
  far, along with how many records were successfully parsed. Doing so
  will give you a sense of how unclean your raw data was. For instance,
  if your program is skipping only 0.5% of the raw data, then it's
  probably not a big deal. But if your program is skipping 35% of the
  raw data, then you need to take a closer look to find out what's
  wrong.


### Use sets or counters to store occurrences of categorical variables

Some of your fields will represent categorical variables. For instance,
in a medical data set, blood type can be either *A*, *B*, *AB*, or *O*. It's a good idea to
assert that blood type must be one of those values, since there are only
four of them. But what if a category contains many more possible values,
especially those that you didn't know about beforehand? In that case,
you cannot write a meaningful assertion. Instead, use a set or counter
data structure in your favorite programming language to keep track of
which values appear in your data set as you're parsing.

By following this idiom, you can:

- print out a message whenever you encounter a new kind of value for
  that categorical variable in the raw data, to make sure it doesn't
  come as a surprise

- inspect the full set of values when your parser finishes to see if any
  of them look weird. For instance, if someone entered *C* for a blood
  type record, that would immediately stand out as an error.


### Restart parsing in the middle of the data set

If you have a lot of raw data, your parsing program will probably take a
long time to churn through all of it. Maybe 5 minutes, maybe 10 minutes,
maybe an hour, maybe even a few days. Chances are, it will often crash
mid-way through parsing.

Say that your raw data has 1 million records and your program crashes on
record number 325,392. If you fix your code and re-run it, chances are
it will still work fine on records 1 to 325,391, so you'll just be
waiting around needlessly for minutes or even hours until your code
tries to parse record 325,392. Instead:

- make your program print out which record it's currently parsing so
  that you can see where it failed

- make it possible to pass a parameter to your program to specify a
  starting point, so that you can tell it to start at, say, record
  325,392. It will keep parsing along and probably crash again at a
  later record. Then you can fix your code and resume at that record and
  repeat until you've parsed all 1 million records.

After everything seems to work, re-run your code on all 1 million
records just to double-check, since your edits might have broken parsing
on earlier records. But in general, making your programs able to restart
by parsing in the middle of your data set will save you a ton of time
and headache when debugging.


### Test on a small subset of your data

Don't try to parse the entire data set at once. When you're in the early
stages of developing and debugging your program, start testing on a
small random subset of the data. Then make that subset bigger as you
gain more confidence. The main reason for using a subset is that your
program will terminate much faster, preferably within a few seconds,
which will tighten your iteration cycle.

However, note that by testing on only a subset of your data, you're less
likely to pick up on weird rare quirks in the data set since they're, by
definition, rare.


### Pipe stdout and stderr to log files

When you're running your program, pipe stdout and stderr to log files so
that you can inspect them using a text editor, `less`, or `tail -f` (for
real-time streaming updates).


### Store raw data alongside cleaned data

This tip is most applicable when you don't care too much about storage
space. In that case, consider storing each record of raw data *inside
of* the corresponding record in the cleaned data set. That way, if you
find a funny-looking record in your cleaned data set, you can
immediately see what raw data it came from, which will make it easier
for you to debug.

However, doing so will double your storage requirements and might make
certain analysis operations a bit slower, so use this technique only
when you can spare the dip in efficiency.


### Finally, write a verifier program to check the integrity of your cleaned data

Along with your parser, also write a verifier that walks over the
cleaned data after parsing and checks that it conforms to the format
that you expect. You have no control over the niceness of the raw data,
but you have all the control over the cleaned data, since you parsed it!
So make sure that it does, in fact, conform to your schema and
expectations.

This final step is *very important* because after you finish parsing,
you'll be working solely with the cleaned data. Chances are, you won't
even touch the raw data again unless something catastrophic happens.
Thus, you want to make sure that your cleaned data is in top shape
before starting your analyses. Otherwise, you might get misleading
results that are ultra-hard to diagnose since they originated from a
long-ago parsing mistake, and your raw data is no longer in front of
you.

These tips might seem like a lot of up-front work to implement, but the
good news is that the time you invest in writing a robust parser will
make your actual analysis workflow much more pleasant. I've learned this
from years of hard-earned experience. Happy parsing!

