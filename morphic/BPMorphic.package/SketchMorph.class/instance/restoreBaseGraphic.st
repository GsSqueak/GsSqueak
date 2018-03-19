menu
restoreBaseGraphic
	"Restore the receiver's base graphic"
	| _gsSqueakTemp_aGraphic |
	((_gsSqueakTemp_aGraphic := self baseGraphic) notNil
			and: [_gsSqueakTemp_aGraphic ~= originalForm])
		ifTrue: [self form: _gsSqueakTemp_aGraphic]