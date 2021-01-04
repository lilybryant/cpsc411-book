#lang reader "assignment-lang.rkt"
@(require
  scribble/core
  scribble/examples
  racket/runtime-path
  (for-label rackunit)
  (for-label cpsc411/compiler-lib)
  (for-label cpsc411/reference/a1-solution))

@;todo{Reset automatically on new assignment.}
@(reset-exercise-counter!)
@(reset-challenge-counter!)

@title[#:tag "top" #:tag-prefix "a1:"]{Milestone 1: Abstracting x64 Boilerplate}

@section{Assignment Summary}

The goal of this assignment is to introduce the process of designing,
implementing, and reasoning about a compiler.
In this assignment, you will implement a small abstraction layer on top of
@ch1-tech{x64}, called @tech[#:tag-prefixes '("book:" "chp-boilerplate:")]{Paren-x64
v1}, which allows easily writing a subset of @ch1-tech{x64} programs while
ignoring some of the boilerplate and operating-system-specific details.

This milestone is due @(due 'a1).

For this assignment, we provide a skeleton to demonstrate the expected
interface: @url{share/a1-skeleton.rkt}

@subsubsub*section{Assignment Checklist}
Before you start, you should read:
@itemlist[
 @item{@secref{grading-design}; and}
 @item{@secref{grading-tests}.}
]
These lay out important expectations regarding grading and sharing of code.

@emph{Completely new passes}
@typeset-passlist[
check-paren-x64
check-paren-x64-syntax
check-paren-x64-init
interp-paren-x64
generate-x64
wrap-x64-run-time
wrap-x64-boilerplate
]

@section{Reading}
The reading for this week is @Secref[#:tag-prefixes '("book:" "chp1:")]{top} and
@Secref[#:tag-prefixes '("book:" "chp-boilerplate:")]{top}.
This milestone description links to the documentation for each exercise in the
chapter for convenience, but you are responsible for the reading the entire
chapter.

@section{Exercises}
@exercise{@emph{Design} and implement the function
@racket[check-paren-x64-syntax].

It might help to start by writing the template, following the instructions from
@secref[#:tag-prefixes '("book:")]{sec:recipe} for templates for language
processors.

Unit test appropriately, with tests for both failure and success. You should
look into the @other-doc['(lib "rackunit/scribblings/rackunit.scrbl")] package.

All tests should be inside the special test submodule.
See @secref["main-and-test" #:doc '(lib "scribblings/guide/guide.scrbl")] for
more details.
}

@exercise{@emph{Design} and implement the function
@racket[check-paren-x64-init].}

@exercise{Implement the function @racket[check-paren-x64].}

@exercise{
@emph{Design} and implement the function @racket[interp-paren-x64], an
interpreter for @tech[#:tag-prefixes '("book:" "chp-boilerplate:")]{Paren-x64
v1}.

To properly implement arithmetic operations, you need to handle two's complement
arithmetic, which overflows on large positive numbers and underflows on small
negative numbers.
You may want to use @racket[x64-add] and @racket[x64-mul] from
@racketmodname[cpsc411/compiler-lib].

While testing, you may want to avoid hard-coding values modulo 256, as the
interpreter may change in later iterations to return values directly.
}

@exercise{
Design and implement the function @racket[generate-x64] which compiles
a @tech[#:tag-prefixes '("book:" "chp-boilerplate:")]{Paren-x64 v1} represented
as an s-expression into an @tech[#:tag-prefixes
'("book:" "chp-boilerplate:")]{instruction sequence}.
}

@exercise{
Design and implement the function @racket[wrap-x64-run-time] which installs
the @tech[#:tag-prefixes '("book:" "chp-boilerplate:")]{Paren-x64 v1} run-time
system.

@racketmodname[cpsc411/compiler-lib] provides some definitions, such as
@racket[sys-exit], that are helpful for this.

Note that a similarly named function exists in that library, but will not
correctly implement the run-time system for this milestone.

For formatting strings in Racket, you may want to investigate @racket[format],
@racket[~a], and @racketmodname[at-exp].
}

@exercise{Design and implement a Racket function @racket[wrap-x64-boilerplate].

Note that a similarly named function exists in the support library, but will not
correctly implement the boilerplate this milestone.
}

@exercise{Test your compiler compiler correctness statement by running the same
programs through your interpreter and through your compiler and comparing the
results.

While testing, you may want to avoid hard-coding values modulo 256, as the
run-time system may change in later iterations to return values directly.
}