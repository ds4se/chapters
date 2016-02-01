# Parse That Data! Practical tips for preparing your raw data for analysis

Data analysis is a central task in the workflow of data scientists,
researchers, software engineers, business analysts, and just about every
professional who needs to work with data. The first mundane step in data
analysis is *preparing raw data*, which can originate from a diverse variety
of sources such as:

- logs from a Web server,
- outputs from a scientific instrument,
- exported data from an online survey,
- data dump from a 1970s government database,
- or reports prepared by external consultants.

What all of these sources of raw data have in common is that you have no control over their format or quirks.
You need to work with what you have been given, which is often:

- incomplete (not all fields are present in all records),
- inconsistent (field names and schemas change throughout the data set),
- and corrupted (some records are malformed in unusual ways).

Thus, you must often write computer programs to parse the raw data and
transform it into a form that is more friendly for analysis. This
often-unglamorous chore is sometimes called *data munging* or *data
wrangling*. In certain domains, you can use specialized tools to ease
this process. But if you do not have access to those tools, or your needs
are more complex, then you will need to write your own parser.

This chapter presents a collection of practical tips for writing reliable and
effective data parsers. These tips can be implemented in any programming language (e.g., Perl, Python, R).


### Use assertions everywhere

Here is the most important tip: write lots of assertions in your parsing
code. Write down every assumption you have about your data's format in
the form of assertions, and then revise those assertions as you find out
which parts of the data violate them.

For instance, should all records be in chronological order? If so,
assert it. Should there be exactly seven fields per record? If so,
assert it. Should the first field always be an even integer between 0
and 26? If so, assert it!

In a perfect world, all records would be cleanly-formatted and abide by
an elegant and fixed schema. But the real world is far from perfect.

If you write good assertions, then your parsing code *will crash a lot*.
This is great news, since every crash (due to assertion failure) means that
you have just discovered one more way in which the raw data violated your
original assumptions. Keep refining your assertions until your code
successfully parses the entire raw data set. But keep them as stringent
as possible, or else they are not doing their job. The worst-case outcome
is data sneaking through your parser in a format that you did not originally expect.


### Print information about broken records

Some records in the raw data will be broken in unfixable ways, so your
program has no choice but to skip over them when parsing. A bad idea is to simply
skip them silently, since you will not know what parts of the data set are corrupted.
Instead, always:

- print a warning to stderr (the error output stream) along with the raw record itself so that you
  can inspect it later to find out what is wrong,

- and keep a running count of how many records your program has skipped so
  far, along with how many records were successfully parsed. Doing so
  will give you a sense of how unclean your raw data was. For instance,
  if your program is skipping only 0.5% of the raw data, then it is
  probably not a big deal. But if your program is skipping 35% of the
  raw data, then you need to take a closer look to find out what is
  wrong.


### Use sets or counters to store occurrences of categorical variables

Some of your fields will represent categorical variables. For instance,
in a medical data set, blood type can be either *A*, *B*, *AB*, or *O*. It is a good idea to
assert that blood type must be one of those values, since there are only
four of them. But what if a category contains many more possible values,
especially those that you did not know about beforehand? In that case,
you cannot write a meaningful assertion.

Instead, use a set or counter
data structure in your favorite programming language to keep track of
which values appear in your data set as it is being parsed.

By following this idiom, you can:

- print out a message whenever you encounter a new kind of value for
  that categorical variable in the raw data, to make sure it does not
  come as a surprise,

- and inspect the full set of values when your parser finishes to see if any
  of them look unusual. For instance, if someone entered *C* for a blood
  type record, that would immediately stand out as an error.


### Restart parsing in the middle of the data set

If you have a lot of raw data, your parsing program will probably take a
long time to process all of it: maybe 5 minutes, maybe 10 minutes,
maybe an hour, maybe even a few days. Chances are, it will often crash
mid-way through parsing.

Say that your raw data has 1 million records and your program crashes on
record number 325,392. If you fix your code and re-run it, chances are
it will still work fine on records 1 to 325,391, so you will just be
waiting around needlessly for minutes or even hours until your code
tries to parse record 325,392. Instead:

- make your program print out which record it is currently parsing so
  that you can see where it failed,

- and make it possible to pass a parameter to your program to specify a
  starting point, so that you can tell it to start at, say, record
  325,392. Your program will keep parsing along and probably crash again at a
  later record. Then you can fix the code, re-run starting at that record, and
  keep fixing bugs until it successfully parses all 1 million records.

Making your programs able to restart by parsing in the middle of your data set will save you lots of time when debugging.
Finally, after everything parses properly, re-run your code on all 1 million
records to double-check, since your edits might have led to regression errors
on earlier records.


### Test on a small subset of your data

Do not try to parse the entire data set at once. When you are in the early
stages of developing and debugging your program, start testing on a
small random subset of the data. Then make that subset bigger as you
gain more confidence. The main reason for using a subset is that your
program will terminate much faster, preferably within a few seconds,
which will tighten your iteration cycle and help you debug faster.

However, note that by testing on only a subset of your data, you are less
likely to pick up on rare quirks in the data set since they are, by
definition, rare.


### Redirect stdout and stderr to log files

When running your program, redirect the stdout and stderr streams to log files so
that you can inspect them later using a text editor, `less`, or `tail -f` (for
real-time streaming updates). On most Mac and Linux terminals, you can use the `>` operator to redirect stdout to a file, and `2>` to redirect stderr to a file.


### Store raw data alongside cleaned data

This tip is most applicable when you have plenty of storage space.
In that case, consider storing each record of raw data *inside
of* the corresponding record in the cleaned data set. That way, if you
find an abnormal record in your cleaned data set, you can
immediately see what raw data it came from, which will make it easier to debug.

However, doing so will double your storage requirements and make
certain analysis operations a bit slower, so use this technique only
when you can stand the loss in efficiency.


### Finally, write a verifier program to check the integrity of your cleaned data

Along with your parser, also write a verifier program that walks over the
cleaned data and checks (asserts) that it conforms to the format
that you expect. You have no control over the quality of the raw data,
but you have *all the control* over the cleaned data, since your program parsed it.
Thus, make sure that it does, in fact, conform to your own schema and
expectations.

This final step is *very important* because after you finish parsing,
you will be working solely with the cleaned data. Chances are, you will not
even touch the raw data again unless something catastrophic happens.
Thus, you want to make sure that your cleaned data is in top shape
before starting your analyses. Otherwise, you might get misleading
results that are ultra-hard to diagnose since they originated from a
long-ago parsing mistake, and your raw data is no longer in front of
you.

In sum, these tips may seem like a lot of up-front work, but the
good news is that the time you invest in writing a robust parser will
make your actual analysis workflow much more pleasant. I have learned this
from years of hard-earned experience. Happy parsing!
