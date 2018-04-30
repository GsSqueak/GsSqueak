menu
buildThreadOfProjects
	| _gsSqueakTemp_projectNames _gsSqueakTemp_threadName |
	_gsSqueakTemp_projectNames := pages
				collect: [:each | (each findA: ProjectViewMorph)
						ifNotNil: [:thisPVM | {thisPVM project name}]].
	_gsSqueakTemp_projectNames := _gsSqueakTemp_projectNames
				reject: [:each | each isNil].
	_gsSqueakTemp_threadName := UIManager default
				request: 'Please name this thread.' translated
				initialAnswer: (self
						valueOfProperty: #nameOfThreadOfProjects
						ifAbsent: ['Projects on Parade' translated]).
	_gsSqueakTemp_threadName isEmptyOrNil
		ifTrue: [^ self].
	InternalThreadNavigationMorph know: _gsSqueakTemp_projectNames as: _gsSqueakTemp_threadName;
		 openThreadNamed: _gsSqueakTemp_threadName atIndex: nil