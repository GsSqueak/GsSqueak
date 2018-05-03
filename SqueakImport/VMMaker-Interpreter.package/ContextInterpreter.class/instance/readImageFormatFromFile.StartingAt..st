image save/restore
readImageFormatFromFile: f StartingAt: imageOffset
	"Read an image header from the given file stream, and answer the image format
	version number for the saved image. Exported to allow platform support code to
	query image files for image format number."

	<export: true>
	<var: #f type: 'sqImageFile '>
	<var: #imageOffset type: 'squeakFileOffsetType '>

	self checkImageVersionFrom: f startingAt: imageOffset.
	^ imageFormatInitialVersion
