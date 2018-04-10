utilities
stripGraphicsForExternalRelease
	"ScriptingSystem stripGraphicsForExternalRelease"
	| _gsSqueakTemp_replacement |
	_gsSqueakTemp_replacement := FormDictionary at: #Gets.
	#('BadgeMiniPic' 'BadgePic' 'Broom' 'CedarPic' 'CollagePic' 'CoverMain' 'CoverSpiral' 'CoverTexture' 'Fred' 'ImagiPic' 'KayaPic' 'StudioPic' )
		do: [:aKey | FormDictionary at: aKey asSymbol put: _gsSqueakTemp_replacement]