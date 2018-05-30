the actions
publishStyle: aSymbol forgetURL: aBoolean withRename: renameBoolean

	| w saveOwner primaryServer rename |

	w := self world ifNil: [^Beeper beep].
	w setProperty: #SuperSwikiPublishOptions toValue: aSymbol.

	primaryServer := w project primaryServerIfNil: [nil].
	rename := ((primaryServer notNil
		and: [primaryServer acceptsUploads]) not)
		or: [renameBoolean].
	rename := rename or: [Smalltalk globals at: #DAVMultiUserServerDirectory ifPresent: [:c | primaryServer isKindOf: c] ifAbsent: [false]].
	w setProperty: #SuperSwikiRename toValue: rename.

	saveOwner := owner.
	self delete.
	[w project 
		storeOnServerShowProgressOn: self 
		forgetURL: aBoolean | rename]
		ensure: [saveOwner addMorphFront: self]