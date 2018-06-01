morphic gui
simpleString: aString

	^self newRow
		layoutInset: 2;
		addMorphBack: (StringMorph contents: aString) lock