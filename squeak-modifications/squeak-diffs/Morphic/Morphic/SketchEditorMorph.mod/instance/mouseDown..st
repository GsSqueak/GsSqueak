morphic
mouseDown: evt
	"Start a new stroke.  Check if any palette setting have changed.  6/11/97 20:30 tk"
	| cur pfPen myAction |
	"verify that we are in a good state"
	self verifyState: evt.		"includes prepareToPaint and #scalingOrRotate"
	pfPen := self get: #paintingFormPen for: evt.
	paintingForm extent = undoBuffer extent ifTrue: [
		paintingForm displayOn: undoBuffer at: 0@0 rule: Form over.
	] ifFalse: [
		undoBuffer := paintingForm deepCopy.	"know we will draw something"
	].
	pfPen place: (evt cursorPoint - bounds origin).
	myAction := self getActionFor: evt.
	palette colorable ifTrue:[
		palette recentColor: (self getColorFor: evt)].
	self set: #strokeOrigin for: evt to: evt cursorPoint.
		"origin point for pickup: rect: ellispe: polygon: line: star:.  Always take it."
	myAction == #pickup: ifTrue: [
		cur := Cursor corner shallowCopy.
		cur offset: 0@0  "cur offset abs".
		evt hand showTemporaryCursor: cur].
	myAction == #polygon: ifTrue: [self polyNew: evt].	"a mode lets you drag vertices"
	self mouseMove: evt.