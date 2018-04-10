widgets required
buildPluggablePanel: aSpec 
	| _gsSqueakTemp_widget |
	_gsSqueakTemp_widget := self panelClass new.
	self register: _gsSqueakTemp_widget id: aSpec name.
	_gsSqueakTemp_widget model: aSpec model.
	"Set child dependent layout properties."
	_gsSqueakTemp_widget
		wantsPaneSplitters: (aSpec wantsResizeHandles
				ifNil: [false]).
	self setLayoutHintsFor: _gsSqueakTemp_widget spec: aSpec.
	_gsSqueakTemp_widget
		layoutInset: (aSpec padding
				ifNil: [0]).
	_gsSqueakTemp_widget
		cellInset: (aSpec spacing
				ifNil: [_gsSqueakTemp_widget wantsPaneSplitters
						ifTrue: [ProportionalSplitterMorph gripThickness]
						ifFalse: [2]]).
	"Now create the children."
	aSpec children isSymbol
		ifTrue: [_gsSqueakTemp_widget getChildrenSelector: aSpec children.
			_gsSqueakTemp_widget update: aSpec children]
		ifFalse: [self buildAll: aSpec children in: _gsSqueakTemp_widget].
	self setFrame: aSpec frame in: _gsSqueakTemp_widget.
	self setLayout: aSpec layout in: _gsSqueakTemp_widget.
	parent
		ifNotNil: [self add: _gsSqueakTemp_widget to: parent].
	_gsSqueakTemp_widget borderWidth: 0.
	self buildHelpFor: _gsSqueakTemp_widget spec: aSpec.
	_gsSqueakTemp_widget color: Color transparent.
	^ _gsSqueakTemp_widget