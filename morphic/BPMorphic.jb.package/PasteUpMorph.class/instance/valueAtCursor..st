cursor
valueAtCursor: aMorph 	submorphs isEmpty		ifTrue: [^ self].	self rectifyCursor.	self replaceSubmorph: self valueAtCursor by: aMorph