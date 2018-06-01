compilation
use: cachedSelector orMakeModelSelectorFor: selectorBody in: selectorBlock 
	| _gsSqueakTemp_selector |
	model
		ifNil: [^ nil].
	cachedSelector
		ifNil: ["Make up selector from slotname if any"
			_gsSqueakTemp_selector := (slotName
						ifNil: [selectorBody]
						ifNotNil: [slotName , selectorBody]) asSymbol.
			(model class canUnderstand: _gsSqueakTemp_selector)
				ifFalse: [(self confirm: 'Shall I compile a null response for' , Character cr asString , model class name , '>>' , _gsSqueakTemp_selector)
						ifFalse: [self halt].
					model class
						compile: (String
								streamContents: [:s | 
									_gsSqueakTemp_selector keywords
										doWithIndex: [:k :i | s nextPutAll: k , ' arg' , i printString].
									s cr; nextPutAll: '"Automatically generated null response."'.
									s cr; nextPutAll: '"Add code below for appropriate behavior..."'])
						classified: 'input events'
						notifying: nil]]
		ifNotNil: [_gsSqueakTemp_selector := cachedSelector].
	^ selectorBlock value: _gsSqueakTemp_selector