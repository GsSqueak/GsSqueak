widgets optional
buildPluggableDialog: aSpec 
	| _gsSqueakTemp_widget |
	_gsSqueakTemp_widget := self dialogClass new.
	self register: _gsSqueakTemp_widget id: aSpec name.
	_gsSqueakTemp_widget model: aSpec model.
	"Set child dependent layout properties. The pane morph holds the
	special contents."
	_gsSqueakTemp_widget paneMorph
		wantsPaneSplitters: (aSpec wantsResizeHandles
				ifNil: [true]).
	self setLayoutHintsFor: _gsSqueakTemp_widget paneMorph spec: aSpec.
	_gsSqueakTemp_widget paneMorph
		layoutInset: (aSpec padding
				ifNil: [ProportionalSplitterMorph gripThickness]).
	_gsSqueakTemp_widget paneMorph
		cellInset: (aSpec spacing
				ifNil: [ProportionalSplitterMorph gripThickness]).
	_gsSqueakTemp_widget paneMorph wantsPaneSplitters
		ifTrue: [_gsSqueakTemp_widget paneMorph addCornerGrips.
			"addEdgeGrips"
			_gsSqueakTemp_widget paneMorph grips
				do: [:ea | ea drawCornerResizeHandles: true]].
	"Now create the children."
	panes := OrderedCollection new.
	aSpec children isSymbol
		ifTrue: [_gsSqueakTemp_widget getChildrenSelector: aSpec children.
			_gsSqueakTemp_widget update: aSpec children]
		ifFalse: [self buildAll: aSpec children in: _gsSqueakTemp_widget paneMorph].
	"Now create the buttons."
	aSpec buttons isSymbol
		ifTrue: [_gsSqueakTemp_widget getButtonsSelector: aSpec buttons.
			_gsSqueakTemp_widget update: aSpec buttons]
		ifFalse: [self buildAll: aSpec buttons in: _gsSqueakTemp_widget buttonRowMorph.
			_gsSqueakTemp_widget updateButtonProperties].
	aSpec title
		ifNotNil: [:label | label isSymbol
				ifTrue: [_gsSqueakTemp_widget getTitleSelector: label;
						 update: label]
				ifFalse: [_gsSqueakTemp_widget title: label]].
	aSpec message
		ifNotNil: [:label | label isSymbol
				ifTrue: [_gsSqueakTemp_widget getMessageSelector: label;
						 update: label]
				ifFalse: [_gsSqueakTemp_widget message: label]].
	"Interaction behavior."
	aSpec autoCancel
		ifNotNil: [:b | _gsSqueakTemp_widget autoCancel: b].
	aSpec exclusive
		ifNotNil: [:b | _gsSqueakTemp_widget exclusive: b].
	_gsSqueakTemp_widget closeDialogSelector: aSpec closeAction.
	self buildHelpFor: _gsSqueakTemp_widget spec: aSpec.
	"Everything is shrink-wrapped around the pane morph."
	_gsSqueakTemp_widget paneMorph
		extent: (aSpec extent
				ifNil: [_gsSqueakTemp_widget initialExtent]).
	^ _gsSqueakTemp_widget