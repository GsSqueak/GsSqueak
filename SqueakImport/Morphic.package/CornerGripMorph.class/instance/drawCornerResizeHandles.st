accessing
drawCornerResizeHandles
	^ self valueOfProperty: #drawCornerResizeHandles ifAbsent: [self class drawCornerResizeHandles]