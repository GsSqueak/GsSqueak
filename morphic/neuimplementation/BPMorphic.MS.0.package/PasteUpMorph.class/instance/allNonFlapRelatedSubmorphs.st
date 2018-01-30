world state
allNonFlapRelatedSubmorphs
	"Answer all non-window submorphs that are not flap-related"
	^ submorphs
		select: [:m | m isSystemWindow not
				and: [m wantsToBeTopmost not]]