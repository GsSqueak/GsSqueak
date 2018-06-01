private
indentationOfLineIndex: lineIndex ifBlank: aBlock 
	"Answer the number of leading tabs in the line at lineIndex. If there
	are no visible characters, pass the number of tabs to aBlock and
	return its value.
	If the line is word-wrap overflow, back up a line and recur."
	| _gsSqueakTemp_arrayIndex _gsSqueakTemp_first _gsSqueakTemp_last _gsSqueakTemp_crlf |
	_gsSqueakTemp_crlf := CharacterSet crlf.
	_gsSqueakTemp_arrayIndex := lineIndex.
	[_gsSqueakTemp_first := (lines at: _gsSqueakTemp_arrayIndex) first.
	_gsSqueakTemp_first > 1
		and: [_gsSqueakTemp_crlf
				includes: (text string at: _gsSqueakTemp_first - 1)]]
		whileTrue: ["word wrap"
			_gsSqueakTemp_arrayIndex := _gsSqueakTemp_arrayIndex - 1].
	_gsSqueakTemp_last := (lines at: _gsSqueakTemp_arrayIndex) last.
	^ (text string copyFrom: _gsSqueakTemp_first to: _gsSqueakTemp_last)
		indentationIfBlank: aBlock