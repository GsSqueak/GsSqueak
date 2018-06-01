menu
buildWindowMenu
	| _gsSqueakTemp_aMenu |
	_gsSqueakTemp_aMenu := MenuMorph new defaultTarget: self.
	_gsSqueakTemp_aMenu add: 'change title...' translated action: #relabel.
	_gsSqueakTemp_aMenu addLine.
	_gsSqueakTemp_aMenu add: 'send to back' translated action: #sendToBack.
	_gsSqueakTemp_aMenu add: 'make next-to-topmost' translated action: #makeSecondTopmost.
	_gsSqueakTemp_aMenu addLine.
	self mustNotClose
		ifTrue: [_gsSqueakTemp_aMenu add: 'make closable' translated action: #makeClosable]
		ifFalse: [_gsSqueakTemp_aMenu add: 'make unclosable' translated action: #makeUnclosable].
	_gsSqueakTemp_aMenu add: (self isSticky
			ifTrue: ['make draggable']
			ifFalse: ['make undraggable']) translated action: #toggleStickiness.
	_gsSqueakTemp_aMenu addLine.
	self unexpandedFrame
		ifNil: [_gsSqueakTemp_aMenu add: 'full screen' translated action: #expandBoxHit]
		ifNotNil: [_gsSqueakTemp_aMenu add: 'original size' translated action: #expandBoxHit].
	self isCollapsed
		ifFalse: [_gsSqueakTemp_aMenu add: 'window color...' translated action: #setWindowColor].
	^ _gsSqueakTemp_aMenu