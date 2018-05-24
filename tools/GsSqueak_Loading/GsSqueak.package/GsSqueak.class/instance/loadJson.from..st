loading
loadJson: baseName from: aFileDirectory

	| file fileName |
	fileName := baseName , '.json'.
	file := aFileDirectory entryAt: fileName ifAbsent: [
		^ self error: ('Missing {1} in directory {2}' format: {fileName . aFileDirectory name})].
	file isDirectory ifTrue: [
		^ self error: ('Expected {1} to be a file, but was a directory' format: {file fullName})].
	^ MCFileTreeJsonParser parse: file readStream contents