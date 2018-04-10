private
readServerBrief
	"If file on server is known to be long, just read the beginning. Cheat
	badly by reading the fileList string."
	| _gsSqueakTemp_lString _gsSqueakTemp_sizeStr _gsSqueakTemp_fsize _gsSqueakTemp_ff _gsSqueakTemp_first5000 _gsSqueakTemp_parts |
	listIndex = 0
		ifTrue: [^ self].
	"Get size from file list entry"
	_gsSqueakTemp_lString := list at: listIndex.
	_gsSqueakTemp_parts := _gsSqueakTemp_lString findTokens: '()'.
	sortMode = #name
		ifTrue: [_gsSqueakTemp_sizeStr := (_gsSqueakTemp_parts second findTokens: ' ') third].
	sortMode = #date
		ifTrue: [_gsSqueakTemp_sizeStr := (_gsSqueakTemp_parts first findTokens: ' ') third].
	sortMode = #size
		ifTrue: [_gsSqueakTemp_sizeStr := (_gsSqueakTemp_parts first findTokens: ' ') first].
	_gsSqueakTemp_fsize := (_gsSqueakTemp_sizeStr copyWithout: $,) asNumber.
	_gsSqueakTemp_fsize <= 50000
		ifTrue: [_gsSqueakTemp_ff := directory oldFileOrNoneNamed: self fullName.
			_gsSqueakTemp_ff
				ifNil: [^ 'For some reason, this file cannot be read' translated].
			contents := _gsSqueakTemp_ff contentsOfEntireFile.
			brevityState := #fullFile.
			"don't change till actually read"
			^ contents].
	"if brevityFlag is true, don't display long files when first selected"
	_gsSqueakTemp_first5000 := directory getOnly: 3500 from: fileName.
	contents := 'File ''{1}'' is {2} bytes long.
You may use the ''get'' command to read the entire file.

Here are the first 3500 characters...
------------------------------------------
{3}
------------------------------------------
... end of the first 3500 characters.' translated format: {fileName. _gsSqueakTemp_sizeStr. _gsSqueakTemp_first5000}.
	brevityState := #briefFile.
	"don't change till actually read"
	^ contents