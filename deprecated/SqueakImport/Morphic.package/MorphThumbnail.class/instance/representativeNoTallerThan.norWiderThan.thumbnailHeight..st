thumbnail
representativeNoTallerThan: maxHeight norWiderThan: maxWidth thumbnailHeight: thumbnailHeight

	"Return a morph representing the receiver but which is no taller than aHeight.  If the receiver is already small enough, just return it, else return a MorphThumbnail companioned to the receiver, enforcing the maxWidth"

	(self height <= maxHeight and: [self width <= maxWidth]) ifTrue: [^ self].

	^ MorphThumbnail new
		extent: maxWidth @ (thumbnailHeight min: self height);
		morphRepresented: morphRepresented