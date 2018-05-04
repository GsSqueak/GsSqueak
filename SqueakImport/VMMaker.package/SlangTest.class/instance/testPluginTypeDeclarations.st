testing base plugins
testPluginTypeDeclarations
	"Pragma declarations should generate the same C source code as the
	traditional method send declarations"

	| stsp m p |
	stsp := SlangTestSupportPlugin inline: false.
	m := (stsp asCString: #varDefByMethod)
			copyReplaceAll: 'varDefByMethod'
			with: 'methodName'.
	p := (stsp asCString: #varDefByPragma)
			copyReplaceAll: 'varDefByPragma'
			with: 'methodName'.
	self assert: m = p