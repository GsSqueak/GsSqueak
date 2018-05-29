as yet unclassified
extentFromParent: aPoint

	| newExtent |

	submorphs isEmpty ifTrue: [^self extent: aPoint].
	newExtent := aPoint truncated.
	bounds := bounds topLeft extent: newExtent.
	newExtent := self recomputeExtent.
	newExtent ifNil: [^self].
	bounds := bounds topLeft extent: newExtent.

