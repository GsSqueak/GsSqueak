utilities
openCogTestsMultiWindowBrowser
	"Answer a new multi-window browser on the test classes in VMMaker"
	"self openCogTestsMultiWindowBrowser"
	| _gsSqueakTemp_testClasses _gsSqueakTemp_b |
	_gsSqueakTemp_testClasses := (PackageInfo named: 'VMMaker') classes
				select: [:c | c inheritsFrom: TestCase].
	_gsSqueakTemp_testClasses removeAll: AbstractInstructionTests allSubclasses.
	_gsSqueakTemp_testClasses
		removeAll: (_gsSqueakTemp_testClasses
				select: [:c | '*Plugin*' match: c name]).
	_gsSqueakTemp_b := Browser open.
	_gsSqueakTemp_testClasses
		do: [:class | _gsSqueakTemp_b selectCategoryForClass: class;
				 selectClass: class]
		separatedBy: [_gsSqueakTemp_b multiWindowState addNewWindow].
	_gsSqueakTemp_b multiWindowState selectWindowIndex: 1