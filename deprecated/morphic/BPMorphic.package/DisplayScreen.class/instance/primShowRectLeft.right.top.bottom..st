private
primShowRectLeft: l right: r top: t bottom: b
  "Copy the given rectangular section of the Display to to the screen.
	This primitive is not implemented on all platforms. If this fails, retry
	integer coordinates."

  "if this fails, coerce coordinates to integers and try again"

  | result |
  result := GraFFIcsLibrary inst drawContents: self bits