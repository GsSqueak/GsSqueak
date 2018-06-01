(PackageInfo named: 'Files') postscript: '| handleArray |
handleArray := StandardFileStream classPool at: #StdioHandles.
(handleArray isNil or: [ handleArray allSatisfy: [ :each | each isNil ] ])	
	ifTrue: [ StandardFileStream startUp: true ]'!
