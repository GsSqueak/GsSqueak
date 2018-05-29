instance creation
from: beginPoint to: endPoint withForm: aForm 
	"Answer an instance of me with end points begingPoint and endPoint; 
	the source form for displaying the line is aForm."

	| newSelf | 
	newSelf := super new: 2.
	newSelf add: beginPoint.
	newSelf add: endPoint.
	newSelf form: aForm.
	^newSelf