testing interpreter
testInterpDeclareExport
	"Pragma declarations should generate the same C source code as the
	traditional method send declarations"

	| stssi m p |
	stssi := SlangTestSupportInterpreter inline: false.
	m := (stssi asCString: #declareExportTrueByMethod)
			copyReplaceAll: 'declareExportTrueByMethod'
			with: 'methodName'.
	p := (stssi asCString: #declareExportTrueByPragma)
			copyReplaceAll: 'declareExportTrueByPragma'
			with: 'methodName'.
	self assert: m = p.

	m := (stssi asCString: #declareExportFalseByMethod)
			copyReplaceAll: 'declareExportFalseByMethod'
			with: 'methodName'.
	p := (stssi asCString: #declareExportFalseByPragma)
			copyReplaceAll: 'declareExportFalseByPragma'
			with: 'methodName'.
	self assert: m = p.