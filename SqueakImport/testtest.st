| test |
test := (SqueakEnvironment at: #TestCase) subclass: #TestTest
	instVarNames: #()
	classVars: #()
	classInstVars: #()
	poolDictionaries: #()
	inDictionary: 'Globals'
	category: 'Kernel'
	options: #().

test newMethodFromSqueakString: 'testAssertion
self assert: true' inEnv: 7.
(SqueakEnvironment at: #TestTest put: test).
((SqueakEnvironment at: #SUnitTest) @env7: buildSuite) @env7: run
