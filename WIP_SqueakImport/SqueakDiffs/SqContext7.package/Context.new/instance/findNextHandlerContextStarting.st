*SqContext7-private-exceptions
findNextHandlerContextStarting
  "Return the next handler marked context, returning nil if there is none.  Search starts with self and proceeds up to nil."

  ^ self _env0 findNextHandlerContextStarting
