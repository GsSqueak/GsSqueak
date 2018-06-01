private
makeThumbnailOfColor: aColor 
	| form |
	form := Form extent: self extent depth: 32.
	form getCanvas fillColor: aColor.
	self image: form