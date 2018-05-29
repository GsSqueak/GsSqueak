system attributes
isRunningSpur
	"Answers if we're running on the Spur memory manager.  Spur has immediate characters.
	 (vmParameterAt: 41 is the image format version for the VM)"

	^Character instSize = 0
	"a.k.a. (self vmParameterAt: 41) anyMask: 16"
