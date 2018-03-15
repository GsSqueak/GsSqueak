initialize-release
resetState
  "Establish the initial conditions for editing the paragraph: place caret 
	before first character, set the emphasis to that of the first character,
	and save the paragraph for purposes of canceling."

  pointBlock := markBlock := paragraph defaultCharacterBlock.
  beginTypeInIndex := nil.
  otherInterval := SqueakInterval from: 1 to: 0.
  self setEmphasisHere.
  selectionShowing := false