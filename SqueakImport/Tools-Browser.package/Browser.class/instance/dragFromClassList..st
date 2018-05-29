drag and drop
dragFromClassList: index 
	"Drag a class from the browser"
	| name envt |
	(name := self classList at: index) ifNil: [ ^ nil ].
	(envt := self selectedEnvironment) ifNil: [ ^ nil ].
	^ envt
		at: name withBlanksTrimmed asSymbol
		ifAbsent: [  ]