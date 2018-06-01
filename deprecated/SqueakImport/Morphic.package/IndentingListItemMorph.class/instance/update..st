updating
update: aspect
	"See ListItemWrapper and subclasses for possible change aspects."
	
	aspect = #contents ifTrue: [
		self isExpanded ifTrue: [self toggleExpandedState].
		self canExpand ifTrue: [self toggleExpandedState].
		container adjustSubmorphPositions].
		
	super update: aspect.