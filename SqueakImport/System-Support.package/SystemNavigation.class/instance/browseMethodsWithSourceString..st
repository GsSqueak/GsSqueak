browse
browseMethodsWithSourceString: aString 
	"SystemNavigation new browseMethodsWithSourceString: 'SourceString'"
	"Launch a browser on all methods whose source code contains aString as 
	a substring."
	| caseSensitive suffix |
	suffix := (caseSensitive := Sensor shiftPressed)
				ifTrue: [' (case-sensitive)']
				ifFalse: [' (use shift for case-sensitive)'].
	^ self
		browseMessageList: (self allMethodsWithSourceString: aString matchCase: caseSensitive)
		name: 'Methods containing ' , aString printString , suffix
		autoSelect: aString