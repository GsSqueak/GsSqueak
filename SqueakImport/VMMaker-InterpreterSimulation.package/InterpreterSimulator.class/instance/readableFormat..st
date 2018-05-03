image save/restore
readableFormat: imageVersion
	"Anwer true if images of the given format are readable by this interpreter. Allows
	a virtual machine to accept selected older image formats.  In our case we can
	select a newer (closure) image format as well as the existing format. Images with
	platform-ordered floats (StackInterpreter and Cog format) are readable but will be
	converted to traditional word ordering."

	bytesPerWord = 4
		ifTrue: [^ (imageVersion = 6502	"Original 32-bit Squeak image format"
			or: [imageVersion = 6504])		"32-bit with closures"
			or: [imageVersion = 6505]]		"32-bit with closures and platform-ordered floats"
		ifFalse: [^ (imageVersion = 68000	"Original 64-bit Squeak image format"
			or: [imageVersion = 68002])	"64-bit with closures"
			or: [imageVersion = 68003]]	"64-bit with closures and platform-ordered floats"
