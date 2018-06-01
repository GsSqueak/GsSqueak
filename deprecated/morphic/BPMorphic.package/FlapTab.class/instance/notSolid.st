solid tabs
notSolid
	"Answer whether the receiver is currenty not solid. Used for
	determining whether the #solidTab menu item should be enabled"
	^ self isCurrentlyTextual
		or: [self isCurrentlyGraphical]