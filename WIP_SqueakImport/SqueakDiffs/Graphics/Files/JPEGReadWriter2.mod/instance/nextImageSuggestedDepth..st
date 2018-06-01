public access
nextImageSuggestedDepth: suggestedDepth
	"Decode and answer a Form of the given depth from my stream. Close the stream if it is a file stream.
	We can read RGB JPEGs into:
		* 32-bit Forms
		* -32-bit Forms
		* 16-bit Forms (with or without dithering!)
		* -16-bit Forms (with or without dithering!)
	We can read grayscale JPEGs into:
		* 32-bit Forms
		* -32-bit Forms
		* 16-bit Forms (with or without dithering!)
		* -16-bit Forms (with or without dithering!)
		* 8-bit grayScale ColorForms (see #isGrayScale)
		* -8-bit grayScale ColorForms (see #isGrayScale)"

	| bytes width height components form jpegDecompressStruct jpegErrorMgr2Struct |
	bytes := stream upToEnd.
	stream close.
	jpegDecompressStruct := ByteArray new: self primJPEGDecompressStructSize.
	jpegErrorMgr2Struct := ByteArray new: self primJPEGErrorMgr2StructSize.
	self 
		primJPEGReadHeader: jpegDecompressStruct 
		fromByteArray: bytes
		errorMgr: jpegErrorMgr2Struct.
	width := self primImageWidth: jpegDecompressStruct.
	height := self primImageHeight: jpegDecompressStruct.
	components := self primImageNumComponents: jpegDecompressStruct.
	form :=
		self supports8BitGrayscaleJPEGs
			ifTrue: [
				components = 3
					ifTrue: [ Form extent: width@height depth: suggestedDepth ]
					ifFalse: [ (Form extent: width@height depth: suggestedDepth) asGrayScale ]]
			ifFalse: [
				Form
					extent: width@height
					depth: 
						(suggestedDepth = 32 
							ifTrue: [ 32 ]
							ifFalse: [
								((suggestedDepth = 16) & (width even))
									ifTrue: [ 16 ]
									ifFalse: [ 32 ]])].
					
	self
		primJPEGReadImage: jpegDecompressStruct
		fromByteArray: bytes
		onForm: form
		doDithering: true
		errorMgr: jpegErrorMgr2Struct.
	^ form