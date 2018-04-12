instance creation
installFamilyNamed: familyName 
	"Install all the corresponding fonts for this family"
	"
	TTFileDescription installFamilyNamed: 'Arial'.
	TTFileDescription installFamilyNamed: 'Batang'.
	"
	| _gsSqueakTemp_fontFiles |
	_gsSqueakTemp_fontFiles := self allFontsAndFiles
				at: familyName
				ifAbsent: [#()].
	_gsSqueakTemp_fontFiles
		do: [:fileName | 
			| ttDesc |
			ttDesc := (self readFontsFrom: fileName)
						detect: [:fnt | fnt familyName = familyName].
			TTCFont newTextStyleFromTT: ttDesc].
	^ TextStyle named: familyName