saving
write
	"Decide whether to write this page on the disk."
	| sf |
	policy == #neverWrite ifTrue: [^ self].
		"demo mode, or write only when user explicitly orders it"

	"All other policies do write:   #now"
	contentsMorph ifNil: [^ self].
	dirty := dirty | ((contentsMorph valueOfProperty: #pageDirty) == true).
		"set by layoutChanged"
	dirty == true ifTrue: [ 
		sf := ServerDirectory new fullPath: url.
		"check for shared password"
		"contentsMorph allMorphsDo: [:m | m prepareToBeSaved].
				done in objectToStoreOnDataStream"
		lastChangeAuthor := Utilities authorInitialsPerSe.
		lastChangeAuthor isEmptyOrNil ifTrue: [ lastChangeAuthor := '*'].
		lastChangeTime := Time totalSeconds.
		Cursor wait showWhile: [ | remoteFile |
			remoteFile := sf fileNamed: url.	"no notification when overwriting"
			remoteFile dataIsValid.
			remoteFile fileOutClass: nil andObject: self.
			"remoteFile close"].
		contentsMorph setProperty: #pageDirty toValue: nil.
		dirty := false].