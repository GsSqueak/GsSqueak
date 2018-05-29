drawing
drawSubmorphsOn: aCanvas

	| r1 fullG r2 newClip deferredMorphs |
	(self innerBounds intersects: aCanvas clipRect) ifFalse: [^self].
	useRegularWarpBlt == true ifTrue: [
		^aCanvas 
			transformBy: transform
			clippingTo: ((self innerBounds intersect: aCanvas clipRect) expandBy: 1) rounded
			during: [:myCanvas |
				submorphs reverseDo:[:m | myCanvas fullDrawMorph: m]
			]
			smoothing: smoothing
	].
	r1 := self innerBounds intersect: aCanvas clipRect.
	r1 area = 0 ifTrue: [^self].
	fullG := (transform localBoundsToGlobal: self firstSubmorph fullBounds) rounded.
	r2 := r1 intersect: fullG.
	r2 area = 0 ifTrue: [^self].
	newClip := (r2 expandBy: 1) rounded intersect: self innerBounds rounded.
	deferredMorphs := #().
	aCanvas 
		transform2By: transform		"#transformBy: for pure WarpBlt"
		clippingTo: newClip
		during: [:myCanvas | | actualCanvas |
			self scale > 1.0 ifTrue: [
				actualCanvas := MultiResolutionCanvas new initializeFrom: myCanvas.
				actualCanvas deferredMorphs: (deferredMorphs := OrderedCollection new).
			] ifFalse: [
				actualCanvas := myCanvas.
			].
			submorphs reverseDo:[:m | actualCanvas fullDrawMorph: m].
		]
		smoothing: smoothing.

	deferredMorphs do: [ :each | | where case |
		where := each bounds: each fullBounds in: self.
		case := 2.
		case = 1 ifTrue: [where := where origin rounded extent: where extent rounded].
		case = 2 ifTrue: [where := where rounded].
		each drawHighResolutionOn: aCanvas in: where.
	].

