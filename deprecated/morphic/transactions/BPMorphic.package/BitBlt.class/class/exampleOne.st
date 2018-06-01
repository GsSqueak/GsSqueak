examples
exampleOne
	"This tests BitBlt by displaying the result of all sixteen combination
	rules that BitBlt is capable of using. (Please see the comment in BitBlt
	for the meaning of the combination rules). This only works at Display
	depth of 1. (Rule 15 does not work?)"
	| pathClass path displayDepth |
	displayDepth := Display depth.
	Display newDepth: 1.
	(Smalltalk hasClassNamed: #Path)
		ifTrue: [pathClass := Smalltalk at: #Path]
		ifFalse: [^ self inform: 'MVC class Path not present in this image'].
	path := pathClass new.
	0
		to: 3
		do: [:i | 0
				to: 3
				do: [:j | path add: j * 100 @ (i * 75)]].
	Display fillWhite.
	path := path translateBy: 60 @ 40.
	1
		to: 16
		do: [:index | BitBlt
				exampleAt: (path at: index)
				rule: index - 1
				fillColor: nil].
	[Sensor anyButtonPressed]
		whileFalse: [].
	Display newDepth: displayDepth