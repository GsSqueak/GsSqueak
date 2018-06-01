start & finish
deleteSelfAndSubordinates
	"Delete the receiver and, if it has one, its subordinate dimForm"
	self delete.
	dimForm
		ifNotNil: [dimForm delete]