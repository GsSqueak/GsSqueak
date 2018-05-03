*EnvironmentsEnv7-classes and traits
classOrTraitNamed: aString 
	"aString is either a class or trait name or a class or trait name followed
	by ' class' or 'classTrait' respectively.
	Answer the class or metaclass it names."
	| _gsSqueakTemp_meta _gsSqueakTemp_baseName |
	(aString endsWith: ' class')
		ifTrue: [_gsSqueakTemp_meta := true.
			_gsSqueakTemp_baseName := aString copyFrom: 1 to: aString size - 6]
		ifFalse: [(aString endsWith: ' classTrait')
				ifTrue: [_gsSqueakTemp_meta := true.
					_gsSqueakTemp_baseName := aString copyFrom: 1 to: aString size - 11]
				ifFalse: [_gsSqueakTemp_meta := false.
					_gsSqueakTemp_baseName := aString]].
	^ declarations
		at: _gsSqueakTemp_baseName asSymbol
		ifPresent: [:global | global isBehavior
				ifTrue: [_gsSqueakTemp_meta
						ifTrue: [global classSide]
						ifFalse: [global]]]
