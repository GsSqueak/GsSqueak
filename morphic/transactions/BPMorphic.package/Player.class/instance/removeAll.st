scripts-standard
removeAll
	"Remove all the elements from my companion morph's collection. This
	is destructive!"
	costume
		ifNotNil: [costume removeAllMorphs]