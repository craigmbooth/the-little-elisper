# The Little eLISPer

## Overview

This repo contains the exercises from the book The Little Schemer translated into Emacs LISP.  Files are organized by chapter, with two files per chapter.  The ``chapter*.el`` files contain the examples from each chapter of the text, and ``chapter*_examples.el`` contains the corresponding examples.  Calling eval-buffer on any of the ``chapter*_examples.el`` files should print the results of each of the examples into the *Messages* buffer.

A few general notes on translating the 'Little Scheme' language into Emacs LISP:

   * Bools in emacs lisp are ``nil`` and ``t`` rather than ``#f`` and ``#t``
   * Use defun instead of ``(define (lambda ()))``
   * In ``cond`` statements, don't use ``else``, instead make the final question in a cond something else that always evaluates to true, i.e. ``t``
   * Need to use ``funcall`` when passing in functions as first class arguments, as [here](http://stackoverflow.com/questions/213267/how-do-i-pass-a-function-as-a-parameter-to-in-elisp)
   * I have added docstrings to all functions that are longer than a single line.

## Chapters

   1. Toys
      * Atoms, lists, null, car, cdr, cons, eq, cond
   1. Do It, Do It Again, and Again, and Again ...
      * Simple recursion on the ``cdr`` of a list
   1. Cons the Magnificent
      * Using ``cons`` to build lists
   1. Numbers Games
      * Arithmetic operations
   1. *Oh My Gawd*: It's Full of Stars
      * Recursion over both the ``car`` and ``cdr`` of a list
   1. Shadows
      * Representations of expressions and numbers
   1. Friends and Relations
   1. Lambda the Ultimate
   1. ... and Again, and Again, and Again, ...
   1. What Is the Value of All of This?

## The Five Rules

   1. *The law of car*: The primitive ``car`` is defined only for non-empty lists
   1. *The law of cdr*: The primitive ``cdr`` is defined only for non-empty lists.  The ``cdr`` of a non-empty list is always another list.
   1. *The law of cons*: The primitive ``cons`` takes two arguments.  The second argument to ``cons`` must be a list, and the result is a list.
   1. *The law of nullp*: The primitive ``nullp`` is defined only for lists
   1. *The law of eq*: The primitive ``eq`` takes two arguments.  Each must be a non-numeric atom.

## Chapter Notes

### Chapter 5

When recursing over two lists there are four termination conditions to consider.  If we can guarantee the lists are the same length then only need to do two of these:

   * Both lists are null
   * The first list is null
   * The second list is null
   * Neither list is null

### Chapter 7

A finite function is a list of pairs in which no first element of any pair is the same as any other first element.
