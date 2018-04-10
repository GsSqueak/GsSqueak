-Protocols-Tools
browseFullProtocol
	"Open up a protocol-category browser on the value of the receiver's
	current selection. If in mvc, an old-style protocol browser is opened
	instead. Someone who still uses mvc might wish to make the
	protocol-category-browser work there too, thanks."
	| _gsSqueakTemp_aClass |
	(Smalltalk isMorphic
			and: [Smalltalk hasClassNamed: #Lexicon])
		ifFalse: [^ self spawnFullProtocol].
	((_gsSqueakTemp_aClass := self selectedClassOrMetaClass) notNil
			and: [_gsSqueakTemp_aClass isTrait not])
		ifTrue: [(Smalltalk at: #Lexicon) new openOnClass: _gsSqueakTemp_aClass showingSelector: self selectedMessageName]