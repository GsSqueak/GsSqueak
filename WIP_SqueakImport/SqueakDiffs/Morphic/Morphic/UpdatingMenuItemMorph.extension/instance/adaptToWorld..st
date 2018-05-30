*Morphic-MorphicExtras-e-toy support
adaptToWorld: aWorld
	super adaptToWorld: aWorld.
	wordingProvider := wordingProvider adaptedToWorld: aWorld.