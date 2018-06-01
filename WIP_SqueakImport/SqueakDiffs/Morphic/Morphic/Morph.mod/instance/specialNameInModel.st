naming
specialNameInModel
	"Return the name for this morph in the underlying model or nil."

	"Not an easy problem.  For now, take the first part of the mouseDownSelector symbol in my eventHandler (fillBrushMouseUp:morph: gives 'fillBrush').  5/26/97 tk"

	| hh |
	(self isMorphicModel) 
		ifTrue: [^self slotName]
		ifFalse: 
			[self eventHandler ifNotNil: 
					[self eventHandler mouseDownSelector ifNotNil: 
							[hh := self eventHandler mouseDownSelector indexOfSubCollection: 'Mouse'
										startingAt: 1.
							hh > 0 
								ifTrue: [^self eventHandler mouseDownSelector copyFrom: 1 to: hh - 1]].
					self eventHandler mouseUpSelector ifNotNil: 
							[hh := self eventHandler mouseUpSelector indexOfSubCollection: 'Mouse'
										startingAt: 1.
							hh > 0 ifTrue: [^self eventHandler mouseUpSelector copyFrom: 1 to: hh - 1]]]].

	"	(self eventHandler mouseDownRecipient respondsTo: #nameFor:) ifTrue: [
					^ self eventHandler mouseDownRecipient nameFor: self]]].	"
	"myModel := self findA: MorphicModel.
			myModel ifNotNil: [^ myModel slotName]"
	^self world specialNameInModelFor: self