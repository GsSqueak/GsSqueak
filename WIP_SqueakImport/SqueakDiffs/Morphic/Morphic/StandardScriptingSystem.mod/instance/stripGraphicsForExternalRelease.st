utilities
stripGraphicsForExternalRelease
	"ScriptingSystem stripGraphicsForExternalRelease"

	|  replacement |
	replacement := FormDictionary at: #Gets.

	#('BadgeMiniPic' 'BadgePic' 'Broom' 'CedarPic' 'CollagePic' 'CoverMain' 'CoverSpiral' 'CoverTexture' 'Fred' 'ImagiPic' 'KayaPic' 'StudioPic')
		do:
			[:aKey | FormDictionary at: aKey asSymbol put: replacement]