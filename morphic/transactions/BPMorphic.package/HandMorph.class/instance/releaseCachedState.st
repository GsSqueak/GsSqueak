caching
releaseCachedState
	| _gsSqueakTemp_oo _gsSqueakTemp_ui |
	_gsSqueakTemp_ui := userInitials.
	super releaseCachedState.
	cacheCanvas := nil.
	_gsSqueakTemp_oo := owner.
	self removeAllMorphs.
	self initialize.
	"nuke everything"
	self privateOwner: _gsSqueakTemp_oo.
	self releaseAllFoci.
	self userInitials: _gsSqueakTemp_ui andPicture: self userPicture