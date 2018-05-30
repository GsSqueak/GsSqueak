instance creation
selections: selList emphases: emphList
	"Answer an instance of the receiver with the given selections and 
	emphases."

	^ (self selections: selList) emphases: emphList

"Example:
	(EmphasizedMenu
		selections: #('how' 'well' 'does' 'this' 'work?') 
		emphases: #(bold plain italic struckOut plain)) startUp"