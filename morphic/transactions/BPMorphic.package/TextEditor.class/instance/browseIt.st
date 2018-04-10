menu messages
browseIt
	"Launch a browser for the current selection, if appropriate"
	| _gsSqueakTemp_aSymbol _gsSqueakTemp_anEntry _gsSqueakTemp_brow |
	Preferences alternativeBrowseIt
		ifTrue: [^ self browseClassFromIt].
	self
		lineSelectAndEmptyCheck: [^ self].
	(_gsSqueakTemp_aSymbol := self selectedSymbol) isNil
		ifTrue: [^ morph flash].
	_gsSqueakTemp_aSymbol first isUppercase
		ifTrue: [_gsSqueakTemp_anEntry := model environment
						valueOf: _gsSqueakTemp_aSymbol
						ifAbsent: [self systemNavigation browseAllImplementorsOf: _gsSqueakTemp_aSymbol.
							^ nil].
			_gsSqueakTemp_anEntry
				ifNil: [^ morph flash].
			(_gsSqueakTemp_anEntry isKindOf: Class)
				ifFalse: [_gsSqueakTemp_anEntry := _gsSqueakTemp_anEntry class].
			_gsSqueakTemp_brow := SystemBrowser default new.
			_gsSqueakTemp_brow setClass: _gsSqueakTemp_anEntry selector: nil.
			_gsSqueakTemp_brow class
				openBrowserView: (_gsSqueakTemp_brow openEditString: nil)
				label: 'System Browser']
		ifFalse: [self systemNavigation browseAllImplementorsOf: _gsSqueakTemp_aSymbol]