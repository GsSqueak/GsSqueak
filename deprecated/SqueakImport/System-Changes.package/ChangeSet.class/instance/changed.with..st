private
changed: anAspectSymbol with: aParameter 
	"Allow objects to depend on the ChangeSet class instead of a particular instance 
	of ChangeSet (which may be switched using projects)."

	ChangeSet changed: anAspectSymbol with: aParameter.
	super changed: anAspectSymbol with: aParameter