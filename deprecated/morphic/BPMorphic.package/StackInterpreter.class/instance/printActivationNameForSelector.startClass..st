debug printing
printActivationNameForSelector: aSelector startClass: startClass 
	| _gsSqueakTemp_methClass |
	(objectMemory addressCouldBeObj: startClass)
		ifTrue: [self
				findClassForSelector: aSelector
				lookupClass: startClass
				do: [:class | _gsSqueakTemp_methClass := class].
			(_gsSqueakTemp_methClass isNil
					or: [startClass = _gsSqueakTemp_methClass])
				ifTrue: [self printNameOfClass: _gsSqueakTemp_methClass count: 5.
					self printChar: $>.
					_gsSqueakTemp_methClass
						ifNil: [self
								printStringOf: (objectMemory splObj: SelectorDoesNotUnderstand).
							self print: ' ']]
				ifFalse: [self printNameOfClass: startClass count: 5.
					self printChar: $(.
					self printNameOfClass: _gsSqueakTemp_methClass count: 5.
					self printChar: $).
					self printChar: $>]]
		ifFalse: [self print: 'INVALID CLASS'].
	(objectMemory addressCouldBeOop: aSelector)
		ifTrue: [(objectMemory isBytes: aSelector)
				ifTrue: [self printStringOf: aSelector]
				ifFalse: [self printOopShort: aSelector]]
		ifFalse: [self print: 'INVALID SELECTOR']