menu messages
pasteRecent
	"Paste an item chose from RecentClippings."
	| _gsSqueakTemp_clipping |
	(_gsSqueakTemp_clipping := Clipboard chooseRecentClipping)
		ifNil: [^ self].
	Clipboard clipboardText: _gsSqueakTemp_clipping.
	^ self paste