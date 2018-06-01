converting
lighter
	"Answer a lighter variant of this form"
	^ self
		collectColors: [:color | color lighter lighter]