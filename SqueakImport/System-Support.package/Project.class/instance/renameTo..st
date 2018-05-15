accessing
renameTo: newName
	| oldBase |
	newName = self name
		ifFalse: [
			oldBase := self resourceDirectoryName.
			version := nil.
			self resourceManager adjustToRename: self resourceDirectoryName from: oldBase.
			self changeSet name: newName.
			].