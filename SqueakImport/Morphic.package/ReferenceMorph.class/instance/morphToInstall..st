misc
morphToInstall: aMorph
	"Create a new tab consisting of a string holding the morph's name"
	| aLabel nameToUse |
	aLabel := StringMorph new contents: (nameToUse := aMorph externalName).
	self addMorph: aLabel.
	aLabel lock.
	self referent: aMorph.
	self setNameTo: nameToUse.
	self fitContents.