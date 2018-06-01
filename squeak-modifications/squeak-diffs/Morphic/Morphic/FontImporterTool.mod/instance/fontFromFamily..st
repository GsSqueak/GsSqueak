helper
fontFromFamily: aFamily

	| readFonts | 
	aFamily ifNil: [^ TextStyle default fonts first].
	readFonts := TTFileDescription readFontsFrom: aFamily allFilenames anyOne.
	^ (readFonts size > 1
		ifTrue: [ 
			| ftArray |
			" see TTCFontSet>>newTextStyleFromTT: "
			ftArray := readFonts collect: [:ttc | |f|
				ttc ifNil: [nil] ifNotNil: [
					f := TTCFont new.
					f ttcDescription: ttc.
					f pointSize: 11.0 .
					f]].
			TTCFontSet newFontArray: ftArray]
		ifFalse: [ |f|
			f := TTCFont new.
			f ttcDescription: readFonts anyOne.
			f pointSize: 11.0 .	
			f])