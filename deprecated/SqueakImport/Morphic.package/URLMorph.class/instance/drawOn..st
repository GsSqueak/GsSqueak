drawing
drawOn: aCanvas
	"Draw thumbnail for my page, if it is available. Otherwise, just draw a rectangle." 

| thumbnail oldExt |
color == Color transparent 
	ifTrue: ["show thumbnail"
		thumbnail := self thumbnailOrNil.
		thumbnail
			ifNil: [aCanvas frameRectangle: bounds width: borderWidth 
						color: borderColor.
				aCanvas fillRectangle: (bounds insetBy: borderWidth) color: color]
			ifNotNil: [oldExt := bounds extent.
				bounds := bounds origin extent: thumbnail extent + (2@2).
				aCanvas frameRectangle: bounds width: borderWidth color: borderColor.
				aCanvas paintImage: thumbnail at: bounds origin + borderWidth.
				oldExt = thumbnail extent ifFalse: [self layoutChanged]]]
	ifFalse: ["show labeled button"
		^ super drawOn: aCanvas]
