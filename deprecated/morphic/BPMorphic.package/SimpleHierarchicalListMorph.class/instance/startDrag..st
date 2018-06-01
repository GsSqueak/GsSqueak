drag and drop
startDrag: evt 
	| _gsSqueakTemp_itemMorph |
	evt hand hasSubmorphs
		ifTrue: [^ self].
	self model okToChange
		ifFalse: [^ self].
	_gsSqueakTemp_itemMorph := scroller submorphs
				detect: [:any | any highlightedForMouseDown]
				ifNone: [^ self].
	"Prepare visuals."
	_gsSqueakTemp_itemMorph highlightForMouseDown: false.
	self setSelectedMorph: _gsSqueakTemp_itemMorph.
	["Initiate drag."
	(self model dragPassengerFor: _gsSqueakTemp_itemMorph inMorph: self)
		ifNotNil: [:passenger | 
			| ddm |
			ddm := (self
						valueOfProperty: #dragTransferClass
						ifAbsent: [TransferMorph])
						withPassenger: passenger
						from: self.
			ddm
				dragTransferType: (self model dragTransferTypeForMorph: self).
			ddm updateFromUserInputEvent: evt.
			self model dragStartedFor: _gsSqueakTemp_itemMorph transferMorph: ddm.
			evt hand grabMorph: ddm]]
		ensure: [Cursor normal show.
			evt hand releaseMouseFocus: self]