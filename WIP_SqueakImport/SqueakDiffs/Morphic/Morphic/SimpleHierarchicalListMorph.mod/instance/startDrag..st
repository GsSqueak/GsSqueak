drag and drop
startDrag: evt 
	
	| itemMorph |
	evt hand hasSubmorphs ifTrue: [^ self].
	self model okToChange ifFalse: [^ self].
	
	itemMorph := scroller submorphs
		detect: [:any | any highlightedForMouseDown]
		ifNone: [^ self].

	"Prepare visuals."
	itemMorph highlightForMouseDown: false.
	self setSelectedMorph: itemMorph.

	[ "Initiate drag."
		(self model dragPassengerFor: itemMorph inMorph: self) ifNotNil: [:passenger | | ddm |
			ddm := (self valueOfProperty: #dragTransferClass ifAbsent: [TransferMorph]) withPassenger: passenger from: self.
			ddm dragTransferType: (self model dragTransferTypeForMorph: self).
			ddm updateFromUserInputEvent: evt.
			self model dragStartedFor: itemMorph transferMorph: ddm.
			evt hand grabMorph: ddm].
	] ensure: [
		Cursor normal show.
		evt hand releaseMouseFocus: self].