printing
printConstructorOn: aStream indent: level nodeDict: nodeDict
	| nodeString |
	(nodeString := nodeDict at: self ifAbsent: [nil])
		ifNotNil: [^ aStream nextPutAll: nodeString].
	submorphs isEmpty ifFalse: [aStream nextPutAll: '('].
	aStream nextPutAll: '('.
	self fullPrintOn: aStream.
	aStream nextPutAll: ')'.
	submorphs isEmpty ifTrue: [^ self].
	submorphs size <= 4
	ifTrue:
		[aStream crtab: level+1;
			nextPutAll: 'addAllMorphs: (Array'.
		1 to: submorphs size do:
			[:i | aStream crtab: level+1; nextPutAll: 'with: '.
			(submorphs at: i) printConstructorOn: aStream indent: level+1 nodeDict: nodeDict].
		aStream nextPutAll: '))']
	ifFalse:
		[aStream crtab: level+1;
			nextPutAll: 'addAllMorphs: ((Array new: ', submorphs size printString, ')'.
		1 to: submorphs size do:
			[:i |
			aStream crtab: level+1; nextPutAll: 'at: ', i printString, ' put: '.
			(submorphs at: i) printConstructorOn: aStream indent: level+1 nodeDict: nodeDict.
			aStream nextPutAll: ';'].
		aStream crtab: level+1; nextPutAll: 'yourself))']