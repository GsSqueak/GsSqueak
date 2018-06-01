as yet unclassified
computeBounds

	| w ratio |

	w := pasteUp width.
	self printSpecs scaleToFitPage ifTrue: [
		^0@0 extent: w@(w * self hOverW) rounded.
	].
	ratio := 8.5 @ 11.
	self printSpecs landscapeFlag ifTrue: [
		ratio := ratio transposed
	].
	^0@0 extent: (ratio * 72) rounded