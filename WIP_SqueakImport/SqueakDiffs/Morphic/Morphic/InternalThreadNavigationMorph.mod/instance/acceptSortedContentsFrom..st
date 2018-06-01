sorting
acceptSortedContentsFrom: aHolder
	"Update my page list from the given page sorter."

	

	threadName isEmpty ifTrue: [threadName := 'I need a name' translated].
	threadName := UIManager default 
		request: 'Name this thread.' translated 
		initialAnswer: threadName.
	threadName isEmptyOrNil ifTrue: [^self].
	listOfPages := OrderedCollection new.
	aHolder submorphs doWithIndex: [:m :i | | cachedData proj nameOfThisProject |
		(nameOfThisProject := m valueOfProperty: #nameOfThisProject) ifNotNil: [
			cachedData := {nameOfThisProject}.
			proj := Project named: nameOfThisProject.
			(proj isNil or: [proj thumbnail isNil]) ifFalse: [
				cachedData := cachedData, {proj thumbnail scaledToSize: self myThumbnailSize}.
			].
			listOfPages add: cachedData.
		].
	].
	self class know: listOfPages as: threadName.
	self removeAllMorphs; addButtons.
	self world ifNil: [
		self openInWorld; positionAppropriately.
	].
