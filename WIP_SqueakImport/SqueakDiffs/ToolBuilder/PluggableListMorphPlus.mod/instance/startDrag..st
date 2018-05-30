drag and drop
startDrag: evt 

	| item itemMorph modelIndex |	
	dragItemSelector ifNil:[^self].
	evt hand hasSubmorphs ifTrue: [^ self].
	self model okToChange ifFalse: [^ self].

	"Ensure selection to save additional click."
	(self modelIndexFor: (self rowAtLocation: evt position)) in: [:evtIndex |
		self selectionIndex = evtIndex ifFalse: [self changeModelSelection: evtIndex]].

	item := self selection ifNil: [^ self].
	itemMorph := StringMorph contents: item asStringOrText.
	modelIndex := self modelIndexFor: self selectionIndex.

	[ "Initiate drag."
		(self model perform: dragItemSelector with: modelIndex) ifNotNil: [:passenger | | ddm |
			ddm := (self valueOfProperty: #dragTransferClass ifAbsent: [TransferMorph]) withPassenger: passenger from: self.
			ddm dragTransferType: (self dragTypeSelector ifNotNil: [:s | self model perform: s with: modelIndex]).
			ddm updateFromUserInputEvent: evt.
			self dragStartedSelector ifNotNil: [:s | self model perform: s with: itemMorph with: ddm].
			evt hand grabMorph: ddm].
	] ensure: [
		Cursor normal show.
		evt hand releaseMouseFocus: self]