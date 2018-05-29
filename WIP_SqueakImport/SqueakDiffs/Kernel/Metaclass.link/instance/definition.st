fileIn/Out
definition
	"Refer to the comment in ClassDescription|definition."

	^ String streamContents:[:strm |
		strm print: self.
		self traitComposition isEmpty ifFalse:[
			strm crtab; nextPutAll: 'uses: '; nextPutAll: self traitComposition asString.
		].
		strm
			crtab;
			nextPutAll: 'instanceVariableNames: ';
			store: self instanceVariablesString]
