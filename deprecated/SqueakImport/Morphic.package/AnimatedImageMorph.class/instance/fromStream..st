private
fromStream: aStream
	self fromReader: (AnimatedGIFReadWriter formsFromStream: aStream)