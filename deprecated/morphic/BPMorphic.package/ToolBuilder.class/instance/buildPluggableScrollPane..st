widgets optional
buildPluggableScrollPane: spec 
	^ spec children
		ifNil: [spec morph
				ifNil: [spec morphClass new]]
		ifNotNil: [self buildPluggablePanel: spec]