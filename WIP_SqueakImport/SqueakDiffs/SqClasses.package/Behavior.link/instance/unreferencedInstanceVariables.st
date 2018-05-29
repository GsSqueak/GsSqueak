user interface
unreferencedInstanceVariables
	"Return a list of the instance variables defined in the receiver which are not referenced in the receiver or any of its subclasses."

	^ self instVarNames select:
		[:ivn |
		self withAllSubclasses allSatisfy:
			[:class |  (class whichSelectorsAccess: ivn) isEmpty]]
