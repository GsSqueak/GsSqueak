instance creation
labelArray: labelArray lines: lineArray
	"Answer an instance of me whose items are in labelArray, with lines 
	drawn after each item indexed by anArray. 2/1/96 sw"

	labelArray isEmpty ifTrue: [self error: 'Menu must not be zero size'].
	^ self
		labels: (String streamContents: 
			[:stream |
			labelArray do: [:each | stream nextPutAll: each; cr].
			stream skip: -1 "remove last CR"])
		lines: lineArray

"Example:
	(PopUpMenu labelArray: #('frog' 'and' 'toad') lines: #()) startUp"