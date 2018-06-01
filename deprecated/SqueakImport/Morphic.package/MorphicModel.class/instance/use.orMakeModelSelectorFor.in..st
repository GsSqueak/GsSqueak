compilation
use: cachedSelector orMakeModelSelectorFor: selectorBody in: selectorBlock
	| selector |
	model ifNil: [^ nil].
	cachedSelector ifNil:
			["Make up selector from slotname if any"
			selector := (slotName ifNil: [selectorBody]
								ifNotNil: [slotName , selectorBody]) asSymbol.
			(model class canUnderstand: selector) ifFalse:
				[(self confirm: 'Shall I compile a null response for'
							, Character cr asString
							, model class name , '>>' , selector)
						ifFalse: [self halt].
				model class compile: (String streamContents:
								[:s | selector keywords doWithIndex:
										[:k :i | s nextPutAll: k , ' arg' , i printString].
								s cr; nextPutAll: '"Automatically generated null response."'.
								s cr; nextPutAll: '"Add code below for appropriate behavior..."'.])
							classified: 'input events'
							notifying: nil]]
		ifNotNil:
			[selector := cachedSelector].
	^ selectorBlock value: selector