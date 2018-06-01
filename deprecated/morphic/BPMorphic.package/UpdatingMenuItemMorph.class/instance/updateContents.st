world
updateContents
	"Update the receiver's contents"
	| _gsSqueakTemp_newString _gsSqueakTemp_enablement _gsSqueakTemp_nArgs |
	(wordingProvider isNil
			or: [wordingSelector isNil])
		ifFalse: [_gsSqueakTemp_nArgs := wordingSelector numArgs.
			_gsSqueakTemp_newString := _gsSqueakTemp_nArgs = 0
						ifTrue: [wordingProvider perform: wordingSelector]
						ifFalse: [(_gsSqueakTemp_nArgs = 1
									and: [wordingArgument notNil])
								ifTrue: [wordingProvider perform: wordingSelector with: wordingArgument]
								ifFalse: [_gsSqueakTemp_nArgs == arguments size
										ifTrue: [wordingProvider perform: wordingSelector withArguments: arguments]]].
			_gsSqueakTemp_newString
					= (self contentString
							ifNil: [contents])
				ifFalse: [self contents: _gsSqueakTemp_newString.
					MenuIcons decorateMenu: owner]].
	enablementSelector
		ifNotNil: [(_gsSqueakTemp_enablement := self enablement) == isEnabled
				ifFalse: [self isEnabled: _gsSqueakTemp_enablement]]