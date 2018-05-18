meta-actions
dismissMorph
	"This is called from an explicit halo destroy/delete action.
	So first disconnect all constraints to keep the graph up to date."

	(self respondsTo: #disconnectAllConstraints) "Connectors package"
		ifTrue: [ self perform: #disconnectAllConstraints ].
	(self respondsTo: #releaseGraphModels) "CGPrereqs package (Connectors)"
		ifTrue: [ self perform: #releaseGraphModels ].
	self world ifNotNil: 
			[:w |  w abandonAllHalos; stopStepping: self].
	self delete