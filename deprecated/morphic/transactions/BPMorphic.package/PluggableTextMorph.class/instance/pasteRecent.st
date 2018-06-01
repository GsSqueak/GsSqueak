menu commands
pasteRecent
	"Paste an item chosen from RecentClippings."
	| _gsSqueakTemp_clipping |
	(_gsSqueakTemp_clipping := Clipboard chooseRecentClipping)
		ifNil: [^ self].
	Clipboard clipboardText: _gsSqueakTemp_clipping.
	^ self
		handleEdit: [textMorph editor paste]