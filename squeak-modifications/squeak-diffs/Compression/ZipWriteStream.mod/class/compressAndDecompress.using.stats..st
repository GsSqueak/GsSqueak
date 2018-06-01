regression test
compressAndDecompress: aFile using: tempName stats: stats
	| fileSize tempFile result |
	aFile == nil ifTrue:[^nil].
	fileSize := aFile size.
	(fileSize < 1"00000" "or:[fileSize > 1000000]") ifTrue:[aFile close. ^nil].
	Transcript cr; show:'Testing ', aFile name,' ... '.
	tempFile := StandardFileStream new open: tempName forWrite: true.
	'Compressing ', aFile name,'...' 
		displayProgressFrom: 1 to: aFile size during:[:bar|
			result := self regressionCompress: aFile into: tempFile notifiying: bar stats: stats].
	result ifTrue:[
		'Validating ', aFile name,'...'
			displayProgressFrom: 0 to: aFile size during:[:bar|
				result := self regressionDecompress: aFile from: tempFile notifying: bar stats: stats]].
	aFile close.
	tempFile close.
	FileDirectory default deleteFileNamed: tempName ifAbsent:[].
	result ~~ false ifTrue:[
		Transcript show:' ok (', (result * 100 truncateTo: 0.01) printString,')'].
	^result