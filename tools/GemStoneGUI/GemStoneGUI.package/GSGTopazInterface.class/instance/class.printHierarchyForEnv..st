new api - classes
class: classProxy printHierarchyForEnv: envId

	| topazOutput |
	self setEnv: 0.
	topazOutput := self run: classProxy codeReferencingMe , ' hierarchy: ' , envId.
	^ topazOutput at: 1