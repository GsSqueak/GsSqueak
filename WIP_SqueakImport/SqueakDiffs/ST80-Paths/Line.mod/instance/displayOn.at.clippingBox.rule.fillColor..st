displaying
displayOn: aDisplayMedium at: aPoint clippingBox: clipRect rule: anInteger fillColor: aForm 
	"The form associated with this Path will be displayed, according  
	to one of the sixteen functions of two logical variables (rule), at  
	each point on the Line. Also the source form will be first anded  
	with aForm as a mask. Does not effect the state of the Path."

	collectionOfPoints size < 2 ifTrue: [self error: 'a line must have two points'].
	aDisplayMedium
		drawLine: self form
		from: self beginPoint + aPoint
		to: self endPoint + aPoint
		clippingBox: clipRect
		rule: anInteger
		fillColor: aForm