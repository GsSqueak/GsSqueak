accessing
form: aForm 
	"Set the receiver's form"
	| _gsSqueakTemp_oldForm _gsSqueakTemp_topRenderer |
	_gsSqueakTemp_oldForm := originalForm.
	(self hasProperty: #baseGraphic)
		ifFalse: [self setProperty: #baseGraphic toValue: aForm].
	originalForm := aForm.
	self rotationCenter: 0.5 @ 0.5.
	self layoutChanged.
	_gsSqueakTemp_topRenderer := self topRendererOrSelf.
	_gsSqueakTemp_oldForm
		ifNotNil: [_gsSqueakTemp_topRenderer position: _gsSqueakTemp_topRenderer position + (_gsSqueakTemp_oldForm extent - aForm extent // 2)]