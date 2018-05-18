initialization
initWithContents: anObject prior: priorMorph forList: hostList indentLevel: newLevel

	container := hostList.
	
	complexContents := anObject.
	anObject addDependent: self.
	
	self initWithContents: self getLabel font: Preferences standardListFont emphasis: nil.
	indentLevel := 0.
	isExpanded := false.
 	nextSibling := firstChild := nil.
	priorMorph ifNotNil: [
		priorMorph nextSibling: self.
	].
	indentLevel := newLevel.
	icon := self getIcon.
	self extent: self minWidth @ self minHeight