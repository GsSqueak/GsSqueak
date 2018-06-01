package list
packageListKey: aChar from: view
	aChar == $f ifTrue: [^ self findClass].
	^ self classListKey: aChar from: view