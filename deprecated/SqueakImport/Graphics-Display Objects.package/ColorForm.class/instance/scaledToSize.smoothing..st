scaling, rotation
scaledToSize: newExtent smoothing: factor
	"super method did not seem to work so well on ColorForms"

	^(self asFormOfDepth: 32) scaledToSize: newExtent smoothing: factor