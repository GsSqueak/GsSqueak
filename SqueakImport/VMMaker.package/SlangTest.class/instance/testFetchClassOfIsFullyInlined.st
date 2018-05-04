testing interpreter
testFetchClassOfIsFullyInlined
	"Test for inlining error resolved in VMMaker 4.13.4 (VMMaker-dtl.343). In this example,
	the ObjectMemoy>>wordMask method must be inlined (marked complete) in order for
	fetchClassOf: to be inlined. Some versions of the inliner treat the #cCode:inSmalltalk:
	at the root of the wordMask method as an indication that it is not completely inlined.
	This in turn prevents fetchClassOf: from being inlined."

	| stssi m |
	stssi := SlangTestSupportInterpreter inline: true.
	m := stssi asCString: #tryInliningForFetchClassOf:.
	self deny: ('*fetchClassOf(rcvr);*' match: m). "fetchClassOf() should not appear as a function call"
	self assert: ('*/# begin fetchClassOf: #/*' match: m). "fetchClassOf: has been inlined"
