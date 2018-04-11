drawing
restoreSavedPatchOn: aCanvas 
	"Clear the changed flag and restore the part of the given canvas under
	this hand from the previously saved patch. If necessary, handle the
	transition to using the hardware cursor."
	hasChanged := false.
	savedPatch
		ifNotNil: [aCanvas drawImage: savedPatch at: savedPatch offset.
			self hasUserInformation
				ifTrue: [^ self].
			"cannot use hw cursor if so"
			submorphs notEmpty
				ifTrue: [^ self].
			(temporaryCursor notNil
					and: [hardwareCursor isNil])
				ifTrue: [^ self].
			"Make the transition to using hardware cursor. Clear
			savedPatch and
			report one final damage rectangle to erase the image of the
			software cursor."
			super
				invalidRect: (savedPatch offset extent: savedPatch extent + self shadowOffset)
				from: self.
			self showHardwareCursor: true.
			savedPatch := nil]