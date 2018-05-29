testing
containsViewableImage

	^ self isJpeg or: [self isGif or: [self isPng]]