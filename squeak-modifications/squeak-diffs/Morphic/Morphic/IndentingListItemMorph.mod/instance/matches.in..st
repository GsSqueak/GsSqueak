filtering
matches: pattern in: model 
	^ ((PluggableTreeMorph filterByLabelsOnly
		ifTrue: [ model itemName ]
		ifFalse: [ self getLabelFor: model ])
			findString: pattern
			startingAt: 1
			caseSensitive: false) > 0