viewing
restoreBoundsOfSubmorphs
	"restores the saved xy-positions and extents"
	submorphs
		do: [:aSubmorph | 
			aSubmorph
				valueOfProperty: #savedExtent
				ifPresentDo: [:anExtent | aSubmorph extent: anExtent].
			aSubmorph
				valueOfProperty: #savedPosition
				ifPresentDo: [:aPosition | aSubmorph position: aPosition]]