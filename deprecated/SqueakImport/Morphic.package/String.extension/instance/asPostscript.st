*Morphic-MorphicExtras-*morphic-Postscript Canvases
asPostscript

	| temp |
	temp := self asString copyReplaceAll: '(' with: '\('.
	temp := temp copyReplaceAll: ')' with: '\)'.
	temp := temp copyReplaceAll: '
' 
			with: ''.
	^ PostscriptEncoder mapMacStringToPS: temp