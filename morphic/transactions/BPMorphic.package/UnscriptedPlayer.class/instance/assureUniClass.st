viewer
assureUniClass
	"Create a uniclass and become the receiver into it"
	| _gsSqueakTemp_anInstance |
	_gsSqueakTemp_anInstance := self rootClassForUniclasses instanceOfUniqueClass.
	_gsSqueakTemp_anInstance initializeCostumesFrom: self.
	self become: _gsSqueakTemp_anInstance.
	^ _gsSqueakTemp_anInstance