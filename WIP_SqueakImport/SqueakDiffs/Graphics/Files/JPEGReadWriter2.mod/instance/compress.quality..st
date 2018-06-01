public access
compress: aForm quality: quality
	"Encode the given Form and answer the compressed ByteArray. Quality goes from 0 (low) to 100 (high), where -1 means default.
	We can only compress:
		* 32-bit deep Forms 
		* -32-bit deep Forms
		* 16-bit deep Forms
		* -16-bit deep Forms
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
	byteCount := self primJPEGWriteImage: jpegCompressStruct 
		onByteArray: buffer
		form: sourceForm
		quality: quality
		progressiveJPEG: false
		errorMgr: jpegErrorMgr2Struct.
	byteCount = 0 ifTrue: [self error: 'buffer too small for compressed data'].
	^ buffer copyFrom: 1 to: byteCount
