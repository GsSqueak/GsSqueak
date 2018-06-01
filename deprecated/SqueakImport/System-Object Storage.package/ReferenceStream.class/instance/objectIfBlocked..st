writing
objectIfBlocked: anObject
	"See if this object is blocked -- not written out and another object substituted."

	^ blockers at: anObject ifAbsent: [anObject]