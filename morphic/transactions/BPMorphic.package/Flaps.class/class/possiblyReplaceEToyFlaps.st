construction support
possiblyReplaceEToyFlaps
	"If in eToyFriendly mode, and if it's ok to reinitialize flaps, replace the
	existing flaps with up-too-date etoy flaps. Caution: this is destructive
	of existing flaps. If preserving the contents of existing flaps is
	important, set the preference 'okToReinitializeFlaps' to true"
	PartsBin thumbnailForPartsDescription: StickyPadMorph descriptionForPartsBin.
	"Puts StickyPadMorph's custom icon back in the cache which typically
	will have been called"
	(Preferences eToyFriendly
			and: [Preferences okToReinitializeFlaps])
		ifTrue: [Flaps disableGlobalFlaps: false.
			Flaps addAndEnableEToyFlaps.
			Smalltalk isMorphic
				ifTrue: [(Smalltalk at: #ActiveWorld) enableGlobalFlaps]]