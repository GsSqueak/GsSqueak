accessing
startRetrieval
	| attempts |
	attempts := self maxAttempts.
	"Note: Only the first request may fail due to not running in a browser"
	url first = $/
		ifTrue: [url := url copyFrom: 2 to: url size].
	fileStream := FileStream requestURLStream: url ifError:[^super startRetrieval].
	[fileStream == nil] whileTrue:[
		attempts := attempts - 1.
		attempts = 0 ifTrue:[^self content:'Error downloading file'].
		fileStream := FileStream requestURLStream: url].
	semaphore signal.