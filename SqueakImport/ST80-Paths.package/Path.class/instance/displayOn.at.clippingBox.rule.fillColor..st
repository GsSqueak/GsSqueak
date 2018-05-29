displaying
displayOn: aDisplayMedium at: aDisplayPoint clippingBox: clipRectangle rule: ruleInteger fillColor: aForm 
	"Display this Path--offset by aPoint, clipped by clipRect and the form 
	associated with this Path will be displayedr according to one of the sixteen 
	functions of two logical variables (rule). Also the source form will be first 
	anded with aForm as a mask. Does not effect the state of the Path"

	collectionOfPoints do: 
		[:element | 
		self form
			displayOn: aDisplayMedium
			at: element + aDisplayPoint
			clippingBox: clipRectangle
			rule: ruleInteger
			fillColor: aForm]