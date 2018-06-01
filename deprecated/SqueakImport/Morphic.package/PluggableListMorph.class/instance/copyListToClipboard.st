menus
copyListToClipboard
	"Copy my items to the clipboard as a multi-line string"

	| stream |
	stream := WriteStream on: (String new: self getList size * 40).
	list do: [:ea | stream nextPutAll: ea asString] separatedBy: [stream nextPut: Character cr].
	Clipboard clipboardText: stream contents