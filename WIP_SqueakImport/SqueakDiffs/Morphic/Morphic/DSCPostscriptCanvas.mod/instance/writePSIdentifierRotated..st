initialization
writePSIdentifierRotated: rotateFlag 
	| morphExtent pageExtent |
	target print: '%!PS-Adobe-2.0'; cr;
		 print: '%%Pages: (atend)'; cr;
		 print: '%%DocumentFonts: (atend)'; cr.
	"Define initialScale so that the morph will fit the page rotated or not"
	savedMorphExtent := morphExtent := rotateFlag
						ifTrue: [psBounds extent transposed]
						ifFalse: [psBounds extent].
	pageExtent := self defaultImageableArea extent asFloatPoint.
	initialScale := (printSpecs isNil
					or: [printSpecs scaleToFitPage])
				ifTrue: [pageExtent x / morphExtent x min: pageExtent y / morphExtent y]
				ifFalse: [1.0].
	target print: '%%BoundingBox: ';
		 write: self defaultImageableArea; cr.
	target print: '%%Title: '; print: self topLevelMorph externalName; cr.
	target print: '%%Creator: '; print: Utilities authorName; cr.
	target print: '%%CreationDate: '; print: Date today asString; space; print: Time now asString; cr.

	target print: '%%Orientation: ';
		
		print: (rotateFlag
				ifTrue: ['Landscape']
				ifFalse: ['Portrait']); cr.
	target print: '%%EndComments'; cr.
