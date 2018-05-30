instance creation
labels: labels lines: linesArray selections: selectionsArray
	"Answer an instance of me whose items are in labels, with lines drawn  
	after each item indexed by linesArray. Labels can be either a string  
	with embedded CRs, or a collection of strings. Record the given array of 
	selections corresponding to the items in labels."

	| labelString |
	(labels isString)
		ifTrue: [labelString := labels]
		ifFalse: [labelString := String streamContents:
					[:s |
					labels do: [:l | s nextPutAll: l; cr].
					s skip: -1]].
	^ (self labels: labelString lines: linesArray) selections: selectionsArray
