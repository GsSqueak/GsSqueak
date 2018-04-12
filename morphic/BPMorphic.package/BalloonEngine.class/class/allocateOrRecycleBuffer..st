private
allocateOrRecycleBuffer: initialSize 
	"Try to recycly a buffer. If this is not possibly, create a new one."
	| _gsSqueakTemp_buffer |
	CacheProtect
		critical: [_gsSqueakTemp_buffer := BufferCache at: 1.
			BufferCache at: 1 put: nil].
	^ _gsSqueakTemp_buffer
		ifNil: [BalloonBuffer new: initialSize]