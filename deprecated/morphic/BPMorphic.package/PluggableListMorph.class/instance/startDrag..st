drag and drop
startDrag: evt 
	| _gsSqueakTemp_item _gsSqueakTemp_itemMorph |
	evt hand hasSubmorphs
		ifTrue: [^ self].
	self model okToChange
		ifFalse: [^ self].
	"Ensure selection to save additional click."
	(self
		modelIndexFor: (self rowAtLocation: evt position))
		in: [:evtIndex | self selectionIndex = evtIndex
				ifFalse: [self changeModelSelection: evtIndex]].
	_gsSqueakTemp_item := self selection
				ifNil: [^ self].
	_gsSqueakTemp_itemMorph := StringMorph contents: _gsSqueakTemp_item asStringOrText.
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