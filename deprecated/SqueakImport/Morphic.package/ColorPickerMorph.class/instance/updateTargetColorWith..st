private
updateTargetColorWith: aColor 
	"Update the target so that it reflects aColor as the color choice"

	(target notNil and: [selector notNil]) 
		ifTrue: 
			[self updateSelectorDisplay.
			^target perform: selector withArguments: (self argumentsWith: aColor)]