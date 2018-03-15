widgets required
buildPluggableWindow: aSpec 
	| _gsSqueakTemp_widget |
	aSpec layout == #proportional
		ifFalse: ["This needs to be implemented - probably by adding a single
			pane and then the rest"
			^ self error: 'Not implemented'].
	_gsSqueakTemp_widget := (self windowClassFor: aSpec) new.
	self register: _gsSqueakTemp_widget id: aSpec name.
	_gsSqueakTemp_widget model: aSpec model.
	"Set child dependent layout properties."
	_gsSqueakTemp_widget
		wantsPaneSplitters: (aSpec wantsResizeHandles
				ifNil: [true]).
	self setLayoutHintsFor: _gsSqueakTemp_widget spec: aSpec.
	_gsSqueakTemp_widget
		layoutInset: (aSpec padding
				ifNil: [ProportionalSplitterMorph gripThickness]).
	_gsSqueakTemp_widget
		cellInset: (aSpec spacing
				ifNil: [ProportionalSplitterMorph gripThickness]).
	"Now create the children."
	panes := OrderedCollection new.
	aSpec children isSymbol
		ifTrue: [_gsSqueakTemp_widget getChildrenSelector: aSpec children.
			_gsSqueakTemp_widget update: aSpec children]
		ifFalse: [self buildAll: aSpec children in: _gsSqueakTemp_widget].
	_gsSqueakTemp_widget setUpdatablePanesFrom: panes.
	aSpec label
		ifNotNil: [:label | label isSymbol
				ifTrue: [_gsSqueakTemp_widget getLabelSelector: label]
				ifFalse: [_gsSqueakTemp_widget setLabel: label]].
	aSpec multiWindowStyle notNil
		ifTrue: [_gsSqueakTemp_widget
				savedMultiWindowState: (SavedMultiWindowState on: aSpec model)].
	_gsSqueakTemp_widget closeWindowSelector: aSpec closeAction.
	self buildHelpFor: _gsSqueakTemp_widget spec: aSpec.
	_gsSqueakTemp_widget
		bounds: (RealEstateAgent
				initialFrameFor: _gsSqueakTemp_widget
				initialExtent: (aSpec extent
						ifNil: [_gsSqueakTemp_widget initialExtent])
				world: self currentWorld).
	^ _gsSqueakTemp_widget