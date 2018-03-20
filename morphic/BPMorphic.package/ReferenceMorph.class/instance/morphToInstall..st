misc
morphToInstall: aMorph 
	"Create a new tab consisting of a string holding the morph's name"
	| _gsSqueakTemp_aLabel _gsSqueakTemp_nameToUse |
	_gsSqueakTemp_aLabel := StringMorph new contents: (_gsSqueakTemp_nameToUse := aMorph externalName).
	self addMorph: _gsSqueakTemp_aLabel.
	_gsSqueakTemp_aLabel lock.
	self referent: aMorph.
	self setNameTo: _gsSqueakTemp_nameToUse.
	self fitContents