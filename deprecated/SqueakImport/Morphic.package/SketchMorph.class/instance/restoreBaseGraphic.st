menu
restoreBaseGraphic
	"Restore the receiver's base graphic"

	| aGraphic |
	((aGraphic := self baseGraphic) notNil and:
				[aGraphic ~= originalForm])
		ifTrue:
			[self form: aGraphic]