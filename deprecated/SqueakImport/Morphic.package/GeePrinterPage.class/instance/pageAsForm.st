as yet unclassified
pageAsForm

	| f canvas |
	f := Form extent: bounds extent depth: 16.
	canvas := f getCanvas.
	canvas fillColor: pasteUp color.
	canvas translateTo: bounds origin negated clippingTo: f boundingBox during: [ :c |
		pasteUp fullDrawForPrintingOn: c
	].
	^f

