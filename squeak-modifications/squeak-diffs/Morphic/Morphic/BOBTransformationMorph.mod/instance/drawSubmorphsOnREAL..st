as yet unclassified
drawSubmorphsOnREAL: aCanvas 

	| newClip |

	(self innerBounds intersects: aCanvas clipRect) ifFalse: [^self].
	newClip := ((self innerBounds intersect: aCanvas clipRect) expandBy: 1) truncated.
	useRegularWarpBlt == true ifTrue: [
		transform scale asFloat = 1.0 ifFalse: [
			newClip := self innerBounds.		"avoids gribblies"
		].
		^aCanvas 
			transformBy: transform
			clippingTo: newClip
			during: [:myCanvas |
				submorphs reverseDo:[:m | myCanvas fullDrawMorph: m]
			]
			smoothing: smoothing
	].
	aCanvas 
		transform2By: transform		"#transformBy: for pure WarpBlt"
		clippingTo: newClip
		during: [:myCanvas |
			submorphs reverseDo:[:m | myCanvas fullDrawMorph: m]
		]
		smoothing: smoothing
