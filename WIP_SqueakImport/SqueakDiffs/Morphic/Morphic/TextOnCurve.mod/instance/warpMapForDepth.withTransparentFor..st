private
warpMapForDepth: destDepth withTransparentFor: bkgndColor 
	(CachedWarpDepth = destDepth and: [CachedWarpColor = bkgndColor]) 
		ifTrue: 
			["Map is OK as is -- return it"

			^CachedWarpMap].
	(CachedWarpMap isNil or: [CachedWarpDepth ~= destDepth]) 
		ifTrue: 
			["Have to recreate the map"

			CachedWarpMap := Color computeColormapFrom: 32 to: destDepth.
			CachedWarpDepth := destDepth]
		ifFalse: 
			["Map is OK, if we restore prior color substiution"

			CachedWarpMap at: (CachedWarpColor indexInMap: CachedWarpMap)
				put: (CachedWarpColor pixelValueForDepth: destDepth)].
	"Now map the background color into transparent, and return the new map"
	CachedWarpColor := bkgndColor.
	CachedWarpMap at: (CachedWarpColor indexInMap: CachedWarpMap) put: 0.
	^CachedWarpMap