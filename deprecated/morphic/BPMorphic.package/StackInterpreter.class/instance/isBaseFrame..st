frame access
isBaseFrame: theFP 
	"A base frame (first frame in a stack page) is so marked by having a
	null saved fp."
	^ (stackPages longAt: theFP + FoxSavedFP)
		= 0