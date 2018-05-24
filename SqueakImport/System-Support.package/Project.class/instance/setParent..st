sub-projects & hierarchy
setParent: newParent

	"Notify the current parent to discard views and other references. Avoids deleting that project later if the former parent is deleted. You can only have one parent anyway.."
	(self parent isKindOf: Project) ifTrue: [
		self parent ~= newParent ifTrue: [self parent deletingProject: self].
	].

	parentProject := newParent.
	nextProject := previousProject := nil.