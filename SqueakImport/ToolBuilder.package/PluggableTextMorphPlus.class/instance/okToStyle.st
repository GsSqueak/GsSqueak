testing
okToStyle

	^ styler
		ifNil:[false]
		ifNotNil: [:s | model aboutToStyle: s]