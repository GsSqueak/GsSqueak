private
sourceForm: aForm
	(aForm depth = 1 and: [destForm depth > 1])
		ifTrue: ["Map 1-bit source to all ones for color mask"
				colorMap := Bitmap with: 0 with: 16rFFFFFFFF]
		ifFalse: [colorMap := nil].
	^ super sourceForm: aForm