menu messages
makeThumbnail
	"Make a thumbnail image of this project from the Display."
	viewSize ifNil: [viewSize := Display extent // 8].
	thumbnail := Form extent: viewSize depth: Display depth.
	(WarpBlt toForm: thumbnail)
			sourceForm: Display;
			cellSize: 2;  "installs a colormap"
			combinationRule: Form over;
			copyQuad: (Display boundingBox) innerCorners
			toRect: (0@0 extent: viewSize).
	(Smalltalk at: #InternalThreadNavigationMorph) ifNotNil: [:tnMorph |
			tnMorph  cacheThumbnailFor: self].
	^thumbnail
