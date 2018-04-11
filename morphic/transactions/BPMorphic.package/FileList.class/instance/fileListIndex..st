file list
fileListIndex: anInteger 
	"Select the file name having the given index, and display its contents."
	| _gsSqueakTemp_item _gsSqueakTemp_name |
	self okToChange
		ifFalse: [^ self].
	listIndex := anInteger.
	listIndex = 0
		ifTrue: [fileName := nil]
		ifFalse: [_gsSqueakTemp_item := self
						fileNameFromFormattedItem: (list at: anInteger).
			(_gsSqueakTemp_item endsWith: self folderString)
				ifTrue: ["remove [...] folder string and open the folder"
					_gsSqueakTemp_name := _gsSqueakTemp_item copyFrom: 1 to: _gsSqueakTemp_item size - self folderString size.
					listIndex := 0.
					brevityState := #FileList.
					self addPath: _gsSqueakTemp_name.
					_gsSqueakTemp_name first = $^
						ifTrue: [self
								directory: (ServerDirectory serverNamed: _gsSqueakTemp_name allButFirst)]
						ifFalse: [volListIndex = 1
								ifTrue: [_gsSqueakTemp_name := _gsSqueakTemp_name , directory slash].
							self
								directory: (directory directoryNamed: _gsSqueakTemp_name)]]
				ifFalse: [fileName := _gsSqueakTemp_item]].
	"open the file selected"
	brevityState := self isGraphicsFileSelected
				ifTrue: [#needToGetGraphic]
				ifFalse: [#needToGetBrief].
	self changed: #fileListIndex;
		 changed: #contents;
		 changed: #labelString.
	self updateButtonRow