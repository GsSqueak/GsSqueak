target access
informTarget
	"Obtain a value from my contents, and tell my target about it. The
	putSelector can take one argument (traditional) or two (as used by
	Croquet) "
	| _gsSqueakTemp_newValue _gsSqueakTemp_typeIn |
	(target notNil
			and: [putSelector notNil])
		ifTrue: [_gsSqueakTemp_typeIn := contents.
			(_gsSqueakTemp_newValue := self valueFromContents)
				ifNotNil: [self checkTarget.
					putSelector numArgs = 1
						ifTrue: [target perform: putSelector with: _gsSqueakTemp_newValue].
					putSelector numArgs = 2
						ifTrue: [target
								perform: putSelector
								with: _gsSqueakTemp_newValue
								with: self].
					target isMorph
						ifTrue: [target changed]].
			self fitContents.
			(format == #default
					and: [_gsSqueakTemp_newValue isNumber])
				ifTrue: [self setDecimalPlacesFromTypeIn: _gsSqueakTemp_typeIn]]