as yet unclassified
directoryUrl
	| ru |
	"A url to the directory this file is in"

	ru := self realUrl.
	^ ru copyFrom: 1 to: (ru size - fileName size)