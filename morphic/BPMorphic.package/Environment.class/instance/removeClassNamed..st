classes and traits
removeClassNamed: aString 
	declarations
		at: aString asSymbol
		ifPresent: [:class | class removeFromSystem]
		ifAbsent: [Transcript cr; show: 'Removal of class named ' , aString , ' ignored because ' , aString , ' does not exist.']