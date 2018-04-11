volume list and pattern
fileNameFormattedFrom: entry sizePad: sizePad 
	"entry is a 5-element array of the form:
	(name creationTime modificationTime dirFlag fileSize)"
	| _gsSqueakTemp_sizeStr _gsSqueakTemp_nameStr _gsSqueakTemp_dateStr |
	_gsSqueakTemp_nameStr := entry isDirectory
				ifTrue: [entry name , self folderString]
				ifFalse: [entry name].
	_gsSqueakTemp_dateStr := ((Date fromSeconds: entry modificationTime)
				printFormat: #(3 2 1 $. 1 1 2 ))
				, ' '
				, (String
						streamContents: [:s | (Time fromSeconds: entry modificationTime \\ 86400)
								print24: true
								on: s]).
	_gsSqueakTemp_sizeStr := entry fileSize asStringWithCommas.
	sortMode = #name
		ifTrue: [^ _gsSqueakTemp_nameStr , '    (' , _gsSqueakTemp_dateStr , ' ' , _gsSqueakTemp_sizeStr , ')'].
	sortMode = #date
		ifTrue: [^ '(' , _gsSqueakTemp_dateStr , ' ' , _gsSqueakTemp_sizeStr , ') ' , _gsSqueakTemp_nameStr].
	sortMode = #size
		ifTrue: [^ '('
				, (String new: sizePad - _gsSqueakTemp_sizeStr size withAll: Character space) , _gsSqueakTemp_sizeStr , ' ' , _gsSqueakTemp_dateStr , ') ' , _gsSqueakTemp_nameStr]