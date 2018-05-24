utilities
associate: tokens
	| result |
	result := Dictionary new.
	tokens pairsDo: [:key :value | 
					| overwrittenValue |
					overwrittenValue := value.
					value isString ifFalse: [overwrittenValue := value collect: [:ea | self associate: ea]].
					value == 'nil' ifTrue: [overwrittenValue := ''].
					result at: key put: overwrittenValue].
	^ result