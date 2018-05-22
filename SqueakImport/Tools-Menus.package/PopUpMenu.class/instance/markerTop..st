marker adjustment
markerTop: aPoint 
	"Answer aPoint, gridded to lines in the receiver."

	^(aPoint y - frame inside top truncateTo: font height) + frame inside top