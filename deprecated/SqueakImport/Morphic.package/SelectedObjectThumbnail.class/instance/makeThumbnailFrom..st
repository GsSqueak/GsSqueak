private
makeThumbnailFrom: aMorphOrNil 
	| thumbnail |
	thumbnail := aMorphOrNil isNil
				ifTrue: [noSelectedThumbnail
						ifNil: [self makeEmptyThumbnail]]
				ifFalse: [aMorphOrNil iconOrThumbnail]. 
	""
	self
		image: (thumbnail scaledIntoFormOfSize: self extent)