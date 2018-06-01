naming
innocuousName
	| r |
	^ (r := self renderedMorph) == self
		ifTrue: [super innocuousName] ifFalse: [r innocuousName]