drag and drop
startDrag: evt 
	| _gsSqueakTemp_itemMorph |
	self dragItemSelector
		ifNil: [^ self].
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
	(self model perform: self dragItemSelector with: _gsSqueakTemp_itemMorph withoutListWrapper)
		ifNotNil: [:passenger | 
			| ddm |
			ddm := (self
						valueOfProperty: #dragTransferClass
						ifAbsent: [TransferMorph])
						withPassenger: passenger
						from: self.
			ddm
				dragTransferType: (self dragTypeSelector
						ifNotNil: [:s | self model perform: s with: _gsSqueakTemp_itemMorph withoutListWrapper]).
			ddm updateFromUserInputEvent: evt.
			self dragStartedSelector
				ifNotNil: [:s | self model
						perform: s
						with: _gsSqueakTemp_itemMorph
						with: ddm].
			evt hand grabMorph: ddm]]
		ensure: [Cursor normal show.
			evt hand releaseMouseFocus: self]