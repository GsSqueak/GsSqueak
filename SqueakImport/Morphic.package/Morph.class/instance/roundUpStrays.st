miscellaneous
roundUpStrays
	"Bring submorphs of playfieldlike structures in the receiver's interior back within view."

	self submorphsDo:
		[:m | m isPlayfieldLike ifTrue: [m roundUpStrays]]