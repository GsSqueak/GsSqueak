sound
readDataFromFile
"This makes very little sense; it appears to be inteded as a general load data method but explicitly handles only AIFF files; very odd"
	| fileName |
	fileName := UIManager default
		chooseFileMatchingSuffixes: #('aif')
		label: 'File name?' translated.
	fileName isEmpty ifTrue: [^ self].
	(StandardFileStream isAFileNamed: fileName) ifFalse: [
		^ self inform: 'Sorry, I cannot find that file' translated].
	self data: (SampledSound fromAIFFfileNamed: fileName) samples.

