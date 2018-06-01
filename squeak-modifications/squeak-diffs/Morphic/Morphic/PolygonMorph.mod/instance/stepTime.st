testing
stepTime
	"Answer the desired time between steps in milliseconds."

	^ self topRendererOrSelf player ifNotNil: [10] ifNil: [100]

	"NB:  in all currently known cases, polygons are not actually wrapped  in TransformationMorphs, so the #topRendererOrSelf call above is probably redundant, but is retained for safety."