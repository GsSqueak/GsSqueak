public access
uncompress: aByteArray into: aForm doDithering: ditherFlag
	"Uncompress an image from the given ByteArray into the given Form. 
	Fails if the given Form has the wrong dimensions or depth.
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

	| jpegDecompressStruct jpegErrorMgr2Struct width height components |
	
	aForm unhibernate.
	
	jpegDecompressStruct := ByteArray new: self primJPEGDecompressStructSize.
	jpegErrorMgr2Struct := ByteArray new: self primJPEGErrorMgr2StructSize.
	self 
		primJPEGReadHeader: jpegDecompressStruct 
		fromByteArray: aByteArray
		errorMgr: jpegErrorMgr2Struct.
	width := self primImageWidth: jpegDecompressStruct.
	height := self primImageHeight: jpegDecompressStruct.
	components := self primImageNumComponents: jpegDecompressStruct.
	
	((aForm width = width) & (aForm height = height)) ifFalse: [
		^ self error: 'form dimensions do not match' ].
	self supports8BitGrayscaleJPEGs
		ifTrue: [
			components = 3
				ifTrue: [
					aForm depth = 8
						ifTrue: [ ^ self error: 'Cannot uncompress multi-channel JPEGs into 8-bit deep forms' ]].
			components = 1
				ifTrue: [
					aForm depth = 8
						ifTrue: [
							aForm isGrayScale 
								ifFalse: [ ^ self error: 'Cannot uncompress single-channel JPEGs into 8-bit deep forms that are not grayscale' ]]]]
						
		ifFalse: [
			aForm nativeDepth < 0
				ifTrue: [ ^ self error: 'Current plugin version doesn''t support uncompressing JPEGs into little-endian forms' ]
				ifFalse: [
					aForm depth = 16
						ifTrue: [
							width odd
								ifTrue: [ ^ self error: 'Current plugin version doesn''t support uncompressing JPEGs with an odd width into 16-bit deep forms' ]].
					aForm depth = 8
						ifTrue: [ ^ self error: 'Current plugin version doesn''t support uncompressing JPEGs into 8-bit deep forms' ]]].

	self primJPEGReadImage: jpegDecompressStruct
		fromByteArray: aByteArray
		onForm: aForm
		doDithering: ditherFlag
		errorMgr: jpegErrorMgr2Struct.
