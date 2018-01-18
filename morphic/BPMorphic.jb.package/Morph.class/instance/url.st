accessing
url	"If I have been assigned a url, return it. For PasteUpMorphs mostly."	self sqkPage		ifNotNil: [:sq | ^ sq url].	^ self valueOfProperty: #url