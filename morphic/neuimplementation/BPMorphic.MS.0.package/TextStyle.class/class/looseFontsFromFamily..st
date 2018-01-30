mime file in/out
looseFontsFromFamily: familyName 
	"
	TextStyle looseFontsFromFamily: 'Accuny'
	TextStyle looseFontsFromFamily: 'Accujen'
	TextStyle actualTextStyles keys collect: [ :k | TextStyle
	looseFontsFromFamily: k ]
	"
	| _gsSqueakTemp_looseFonts _gsSqueakTemp_realStyle _gsSqueakTemp_classes |
	_gsSqueakTemp_realStyle := TextStyle named: familyName.
	_gsSqueakTemp_classes := ((_gsSqueakTemp_realStyle fontArray copyWithout: nil)
				collect: [:f | f class]) asSet.
	_gsSqueakTemp_classes
		do: [:cls | cls
				allSubInstancesDo: [:f | f releaseCachedState]].
	Smalltalk garbageCollect.
	_gsSqueakTemp_looseFonts := IdentitySet new.
	_gsSqueakTemp_classes
		do: [:cls | _gsSqueakTemp_looseFonts
				addAll: ((cls allSubInstances
						select: [:ea | ea familyName = familyName])
						reject: [:f | _gsSqueakTemp_realStyle fontArray
								anySatisfy: [:fn | fn == f
										or: [fn derivativeFonts includes: f]]])].
	^ _gsSqueakTemp_looseFonts