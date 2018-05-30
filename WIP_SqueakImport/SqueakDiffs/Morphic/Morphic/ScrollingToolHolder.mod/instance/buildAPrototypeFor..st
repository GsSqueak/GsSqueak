initialize-release
buildAPrototypeFor: aPaintBoxMorph
	pickupButtons := (aPaintBoxMorph submorphNamed: 'stamps') submorphs select: [:e | e externalName = 'pickup:'].
	stampButtons := (aPaintBoxMorph submorphNamed: 'stamps') submorphs select: [:e | e externalName = 'stamp:'].
	stamps := OrderedCollection new: 3 withAll: nil.
	thumbnailPics := OrderedCollection new: 3 withAll: nil.
	start := 3.