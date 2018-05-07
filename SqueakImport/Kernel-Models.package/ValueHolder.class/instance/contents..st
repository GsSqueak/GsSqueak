accessing
contents: newContents

	contents = newContents ifTrue: [^ self].
	contents := newContents.
	self contentsChanged