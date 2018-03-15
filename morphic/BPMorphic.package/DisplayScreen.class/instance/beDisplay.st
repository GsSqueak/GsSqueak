private
beDisplay
  "Primitive. Tell the interpreter to use the receiver as the current display
	image. Fail if the form is too wide to fit on the physical display. 
	Essential. See Object documentation whatIsAPrimitive."

  | result |
  bpWindow := BPWindow new: (Rectangle origin: offset corner: width @ height).
  ^ 0