-Etoys-scripting
bringTileScriptingElementsUpToDate
	"Send #bringUpToDate to every tile-scripting element of the receiver,
	including possibly the receiver itself"
	(self allMorphs
		select: [:s | s isTileScriptingElement])
		do: [:el | el bringUpToDate]