geometry
extent: aPoint

	| newExtent |

	newExtent := aPoint truncated.
	bounds extent = newExtent ifTrue: [^self].
	bounds := bounds topLeft extent: newExtent.
	self recomputeExtent.

