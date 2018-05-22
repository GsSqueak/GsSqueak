layout
addCenteredAtBottom: aMorph offset: anOffset
	"Add aMorph beneath all other morphs currently in the receiver, centered horizontally, with the vertical offset from the bottom of the previous morph given by anOffset"
	| curBot |
	curBot := 0.
	submorphs do: [:m | curBot := curBot max: m bottom].
	self addMorphBack: aMorph.
	aMorph position: ((self center x - (aMorph width // 2)) @ (curBot + anOffset))