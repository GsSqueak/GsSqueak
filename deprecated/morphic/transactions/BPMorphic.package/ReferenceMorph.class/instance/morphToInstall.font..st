misc
morphToInstall: aMorph font: aFont 
	"Create a new tab consisting of a string holding the morph's name"
	| _gsSqueakTemp_aLabel _gsSqueakTemp_nameToUse |
	_gsSqueakTemp_aLabel := StringMorph contents: (_gsSqueakTemp_nameToUse := aMorph externalName) font: aFont.
	self addMorph: _gsSqueakTemp_aLabel.
	_gsSqueakTemp_aLabel lock.
	self referent: aMorph.
	self setNameTo: _gsSqueakTemp_nameToUse.
	self fitContents