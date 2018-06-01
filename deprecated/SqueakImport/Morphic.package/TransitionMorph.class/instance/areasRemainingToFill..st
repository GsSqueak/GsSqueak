drawing
areasRemainingToFill: aRectangle
	"May be overridden by any subclasses with opaque regions"

	^ aRectangle areasOutside: self bounds