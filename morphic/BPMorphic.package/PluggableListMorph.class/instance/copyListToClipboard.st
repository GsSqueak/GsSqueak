menus
copyListToClipboard
	"Copy my items to the clipboard as a multi-line string"
	| _gsSqueakTemp_stream |
	_gsSqueakTemp_stream := WriteStream
				on: (String new: self getList size * 40).
	list
		do: [:ea | _gsSqueakTemp_stream nextPutAll: ea asString]
		separatedBy: [_gsSqueakTemp_stream nextPut: Character cr].
	Clipboard clipboardText: _gsSqueakTemp_stream contents