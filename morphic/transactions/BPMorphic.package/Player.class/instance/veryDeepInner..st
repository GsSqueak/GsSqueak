copying
veryDeepInner: deepCopier 
	"Special code that handles user-added instance variables of a uniClass.
	Copy all of my instance variables. Some need to be not copied at all,
	but shared. This is special code for the dictionary. See DeepCopier."
	| _gsSqueakTemp_instVar _gsSqueakTemp_weak |
	super veryDeepInner: deepCopier.
	"my own instance variables are completely normal"
	costume := costume veryDeepCopyWith: deepCopier.
	costumes := costumes veryDeepCopyWith: deepCopier.
	Player instSize + 1
		to: self class instSize
		do: [:index | 
			_gsSqueakTemp_instVar := self instVarAt: index.
			_gsSqueakTemp_weak := _gsSqueakTemp_instVar isMorph | _gsSqueakTemp_instVar isPlayerLike.
			(deepCopier references
				associationAt: _gsSqueakTemp_instVar
				ifAbsent: [])
				ifNil: ["use association, not value, so nil is an exceptional
					value "
					_gsSqueakTemp_weak
						ifFalse: [self
								instVarAt: index
								put: (_gsSqueakTemp_instVar veryDeepCopyWith: deepCopier)]]
				ifNotNil: [:_gsSqueakTemp_subAss | self instVarAt: index put: _gsSqueakTemp_subAss value]]