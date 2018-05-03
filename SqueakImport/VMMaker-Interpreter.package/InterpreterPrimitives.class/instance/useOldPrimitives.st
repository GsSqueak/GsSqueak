primitive table
useOldPrimitives
	"The primitives table changes over time. An image may require a specific set
	of numbered primitives in order to function as originally intended, but in general
	the images prior to the introduction of full block closures can run successfully with
	one set of older primitives, and later images can use a more recent set.

	Answer true if the older set of primitives should be used."

	^self hasClosures not
