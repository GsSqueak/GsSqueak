initialization
addWeakDependent: anObject

	weakDependents ifNil: [^weakDependents := WeakArray with: anObject].
	weakDependents := weakDependents,{anObject} reject: [ :each | each isNil].