caching
releaseCachedState
	| oo ui |
	ui := userInitials.
	super releaseCachedState.
	cacheCanvas := nil.
	oo := owner.
	self removeAllMorphs.
	self initialize.	"nuke everything"
	self privateOwner: oo.
	self releaseAllFoci.
	self userInitials: ui andPicture: (self userPicture).