copying
postCopy
  super postCopy.
  mutex := TransientMutex new.
  heap := heap copy