model access
setValue: newValue 
	"Update the target with this sliders new value."

	| scaledValue |
	self value: newValue.
	scaledValue := newValue * (maxVal - minVal) + minVal.
	truncate ifTrue: [scaledValue := scaledValue truncated].
	(target notNil and: [setValueSelector notNil]) 
		ifTrue: 
			[Cursor normal showWhile: 
					[target perform: setValueSelector
						withArguments: (arguments copyWith: scaledValue)]]