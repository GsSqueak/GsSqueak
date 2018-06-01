private
parseCapabilities: lines

	self serverCapabilities addAll: (lines select: [:l | l notEmpty] 
			thenCollect: [:l | | tokens capability values |
				tokens := l findTokens: String space.
				capability := tokens first asSymbol.
				values := tokens allButFirst
					ifEmpty: [true]
					ifNotEmpty: [:rawValues | rawValues collect: [:v | 
						v isAllDigits
							ifTrue: [v asNumber]
							ifFalse: [v asSymbol]]].
				capability -> values])