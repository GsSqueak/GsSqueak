public access
nextPutImage: aForm quality: quality progressiveJPEG: progressiveFlag
	"Encode the given Form on my stream with the given settings. Quality goes from 0 (low) to 100 (high), where -1 means default. If progressiveFlag is true, encode as a progressive JPEG.
	We can compress:
		* 32-bit deep Forms 
		* -32-bit deep Forms
		* 16-bit deep
		* -16-bit deep
		* GrayScale ColorForms (see #isGrayScale)"

	| sourceForm jpegCompressStruct jpegErrorMgr2Struct buffer byteCount |
	
	aForm unhibernate.
	
	sourceForm := self supports8BitGrayscaleJPEGs 
		ifTrue: [ 
			(aForm depth = 32) | (aForm depth = 16) | (aForm isGrayScale)
				ifTrue: [aForm]
				ifFalse: [aForm asFormOfDepth: 32 ]]
		ifFalse: [
			(aForm nativeDepth > 0) & ((aForm depth = 32) | ((aForm depth = 16) & (aForm width even)))
				ifTrue: [aForm]
				ifFalse: [aForm asFormOfDepth: 32 ]].
	
	jpegCompressStruct := ByteArray new: self primJPEGCompressStructSize.
	jpegErrorMgr2Struct := ByteArray new: self primJPEGErrorMgr2StructSize.
	buffer := ByteArray new: sourceForm width * sourceForm height + 1024.
	"Try to write the image. Retry with a larger buffer if needed."
	[
		byteCount := self primJPEGWriteImage: jpegCompressStruct 
			onByteArray: buffer
			form: sourceForm
			quality: quality
			progressiveJPEG: progressiveFlag
			errorMgr: jpegErrorMgr2Struct.
		byteCount = 0 and: [ buffer size < (sourceForm width * sourceForm height * 3 + 1024) ] ]
			whileTrue: [ buffer := ByteArray new: buffer size * 2 ].
	byteCount = 0 ifTrue: [ self error: 'buffer too small for compressed data' ].
	stream next: byteCount putAll: buffer startingAt: 1.
	self close.
