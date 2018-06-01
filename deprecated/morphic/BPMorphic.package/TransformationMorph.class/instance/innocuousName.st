naming
innocuousName
	| _gsSqueakTemp_r |
	^ (_gsSqueakTemp_r := self renderedMorph) == self
		ifTrue: [super innocuousName]
		ifFalse: [_gsSqueakTemp_r innocuousName]