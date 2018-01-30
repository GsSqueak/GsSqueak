private
primShowRectLeft: l right: r top: t bottom: b
  "Copy the given rectangular section of the Display to to the screen.
	This primitive is not implemented on all platforms. If this fails, retry
	integer coordinates."

  "if this fails, coerce coordinates to integers and try again"

  | result |
  result := drawBitmapCo
    callWith:
      {(bits cArray).
      l.
      r.
      t.
      b}.
  result = 0
    ifFalse: [ 
      self
        primRetryShowRectLeft: l truncated
        right: r rounded
        top: t truncated
        bottom: b rounded ]