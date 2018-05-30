volume list and pattern
fileNameFormattedFrom: entry sizePad: sizePad
	"entry is a 5-element array of the form:
		(name creationTime modificationTime dirFlag fileSize)"
	| sizeStr nameStr dateStr |
	nameStr := entry isDirectory
		ifTrue: [entry name , self folderString]
		ifFalse: [entry name].
	dateStr := ((Date fromSeconds: entry modificationTime )
					printFormat: #(3 2 1 $. 1 1 2)) , ' ' ,
				(String streamContents: [:s |
					(Time fromSeconds: entry modificationTime \\ 86400)
						print24: true on: s]).
	sizeStr := entry fileSize asStringWithCommas.
	sortMode = #name ifTrue:
		[^ nameStr , '    (' , dateStr , ' ' , sizeStr , ')'].
	sortMode = #date ifTrue:
		[^ '(' , dateStr , ' ' , sizeStr , ') ' , nameStr].
	sortMode = #size ifTrue:
		[^ '(' , (String new: sizePad - sizeStr size withAll: Character space) , sizeStr , ' ' , dateStr , ') ' , nameStr].
