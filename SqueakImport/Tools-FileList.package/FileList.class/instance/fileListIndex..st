file list
fileListIndex: anInteger
	"Select the file name having the given index, and display its contents."

	| item name |
	self okToChange ifFalse: [^ self].
	listIndex := anInteger.
	listIndex = 0 
		ifTrue: [fileName := nil]
		ifFalse:
			[item := self fileNameFromFormattedItem: (list at: anInteger).
			(item endsWith: self folderString)
				ifTrue:
					["remove [...] folder string and open the folder"
					name := item copyFrom: 1 to: item size - self folderString size.
					listIndex := 0.
					brevityState := #FileList.
					self addPath: name.
					name first = $^
						ifTrue: [self directory: (ServerDirectory serverNamed: name allButFirst)]
						ifFalse: [volListIndex = 1 ifTrue: [name := name, directory slash].
							self directory: (directory directoryNamed: name)]]
				ifFalse: [fileName := item]].  "open the file selected"

	brevityState := self isGraphicsFileSelected
		ifTrue: [#needToGetGraphic]
		ifFalse: [#needToGetBrief]..
	self 
		changed: #fileListIndex ;
		changed: #contents ;
		changed: #labelString.
	self updateButtonRow