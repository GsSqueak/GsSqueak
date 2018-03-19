-Etoys-utilities
reinvigorateThumbnailsInViewerFlapTabs
	"It has happened that the thumbnail in a viewer flap tab will go solid
	gray because it got associated with some passing and disused player
	temporarily created during the initial painting process. This method
	takes a sledge hammer to repair such thumbnails. At its genesis, this
	method is called only from the postscript of its defining fileout."
	ViewerFlapTab
		allInstancesDo: [:aTab | 
			| vwr thumbnail |
			vwr := aTab referent findA: StandardViewer.
			thumbnail := aTab findA: ThumbnailMorph.
			(vwr notNil
					and: [thumbnail notNil])
				ifTrue: [thumbnail objectToView: vwr scriptedPlayer]
			"ScriptingSystem reinvigorateThumbnailsInViewerFlapTabs"]