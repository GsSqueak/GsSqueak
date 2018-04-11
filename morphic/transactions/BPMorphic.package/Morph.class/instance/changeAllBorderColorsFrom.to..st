-Etoys-support
changeAllBorderColorsFrom: oldColor to: newColor 
	"Set any occurrence of oldColor as a border color in my entire
	submorph tree to be newColor"
	(self allMorphs
		select: [:m | m respondsTo: #borderColor:])
		do: [:aMorph | aMorph borderColor = oldColor
				ifTrue: [aMorph borderColor: newColor]]