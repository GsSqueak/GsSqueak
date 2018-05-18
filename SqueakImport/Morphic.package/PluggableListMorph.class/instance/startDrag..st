drag and drop
startDrag: evt 

	| item itemMorph |
	evt hand hasSubmorphs ifTrue: [^ self].
	self model okToChange ifFalse: [^ self].

	"Ensure selection to save additional click."
	(self modelIndexFor: (self rowAtLocation: evt position)) in: [:evtIndex |
		self selectionIndex = evtIndex ifFalse: [self changeModelSelection: evtIndex]].

	item := self selection ifNil: [^ self].
	itemMorph := StringMorph contents: item asStringOrText.
	
	[ "Initiate drag."
		(self model dragPassengerFor: itemMorph inMorph: self) ifNotNil: [:passenger | | ddm |
			ddm := (self valueOfProperty: #dragTransferClass ifAbsent: [TransferMorph]) withPassenger: passenger from: self.
			ddm dragTransferType: (self model dragTransferTypeForMorph: self).
			ddm updateFromUserInputEvent: evt.
			self model dragStartedFor: itemMorph transferMorph: ddm.
			evt hand grabMorph: ddm]
	] ensure: [
		Cursor normal show.
		evt hand releaseMouseFocus: self].