private
asWindow: aRectangle

	| outer |
	outer := parent window ifNil: [topSize].
	^(aRectangle origin * outer extent) truncated
		corner: (aRectangle corner * outer extent) truncated