as yet unclassified
nearestTextPlusMorphTo: aMorph 
	^ self allTextPlusMorphs
		inject: nil
		into: [:best :each | self
				select: best
				or: each
				asClosestTo: aMorph]