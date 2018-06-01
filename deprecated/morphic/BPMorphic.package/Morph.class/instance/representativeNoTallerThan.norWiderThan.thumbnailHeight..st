thumbnail
representativeNoTallerThan: maxHeight norWiderThan: maxWidth thumbnailHeight: thumbnailHeight 
	"Return a morph representing the receiver but which is no taller than
	aHeight. If the receiver is already small enough, just return it, else
	return a MorphThumbnail companioned to the receiver, enforcing the
	maxWidth. If the receiver personally *demands* thumbnailing, do it
	even if there is no size-related reason to do it."
	self demandsThumbnailing
		ifFalse: [self permitsThumbnailing
				ifFalse: [^ self].
			(self fullBounds height <= maxHeight
					and: [self fullBounds width <= maxWidth])
				ifTrue: [^ self]].
	^ MorphThumbnail new extent: maxWidth
			@ (thumbnailHeight min: self fullBounds height);
		 morphRepresented: self