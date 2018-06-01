image save/restore
initialImageFormatVersion
	"This is the image format version that was saved to in the previous image snapshot.
	The interpreter checks this value at image load time to determine if it is able to load
	and run the image file. When the image is next saved, it will be saved using the current
	imageFormatVersion, which may be different from imageFormatInitialVersion.
	Selector name chosen to avoid conflict with variable declaration in generated code."
	^imageFormatInitialVersion