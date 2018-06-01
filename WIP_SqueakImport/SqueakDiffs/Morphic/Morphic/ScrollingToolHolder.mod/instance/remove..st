accessing
remove: tool
	"Remove a stamp.  Make this stamp blank.  OK to have a bunch of blank ones."

	| which |
	which := stampButtons indexOf: tool ifAbsent: [
				pickupButtons indexOf: tool ifAbsent: [^ self]].
	stamps atWrap: which+start-1 put: nil.
	thumbnailPics atWrap: which+start-1 put: nil.
	self normalize.	"show them"