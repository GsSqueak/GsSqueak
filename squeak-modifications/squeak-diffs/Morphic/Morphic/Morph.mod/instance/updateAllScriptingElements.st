naming
updateAllScriptingElements
	"A sledge-hammer sweep from the world down to make sure that all live scripting elements are up to date.  Presently in eclipse, not sent at the moment."

	| aPasteUp |
	(aPasteUp := self topPasteUp) ifNotNil:
		[aPasteUp allTileScriptingElements do: [:m | m bringUpToDate]]