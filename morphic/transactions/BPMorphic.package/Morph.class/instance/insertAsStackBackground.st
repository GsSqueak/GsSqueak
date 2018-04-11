-Etoys-card in a stack
insertAsStackBackground
	"I am not yet in a stack. Find a Stack that my reference point (center)
	overlaps, and insert me as a new background."
	| _gsSqueakTemp_aMorph |
	self isStackBackground
		ifTrue: [^ Beeper beep].
	"already in a stack. Must clear flags when remove."
	"self potentialEmbeddingTargets do: [:mm | No, force user to choose a
	stack. 
	(mm respondsTo: #insertAsBackground:resize:) ifTrue: [
	^ mm insertAsBackground: self resize: false]]
	"
	"None found, ask user"
	self inform: 'Please click on a Stack' translated.
	Sensor waitNoButton.
	_gsSqueakTemp_aMorph := self world chooseClickTarget.
	_gsSqueakTemp_aMorph
		ifNil: [^ self].
	(_gsSqueakTemp_aMorph ownerThatIsA: StackMorph)
		insertAsBackground: self
		resize: false