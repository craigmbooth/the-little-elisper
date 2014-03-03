Calling eval-buffer on any of the ``chapter*.el`` files should print the results of each of the examples into the *Messages* buffer.

   * Bools in emacs lisp are nil and t
   * Use defun instead of ``(define (lambda ()))``
   * Emacs lisp doesn't have 'else', instead make the final question in a cond something else that always evaluates to true, i.e. 't'
   * Added docstrings
