initialize-release
initScannerForTokenization
	"Use a version of typeTable that doesn't raise xIllegal when enocuntering an _"
	| underscoreIndex |
	underscoreIndex := typeTable identityIndexOf: #xUnderscore ifAbsent: [^self].
	typeTable := typeTable copy.
	typeTable at: underscoreIndex put: #xUnderscoreForTokenization