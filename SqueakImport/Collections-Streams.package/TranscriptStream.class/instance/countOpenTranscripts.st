private
countOpenTranscripts
	"Transcript countOpenTranscripts"

	^ (self dependents select: [:e | e isTextView]) size
