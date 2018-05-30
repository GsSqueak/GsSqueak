morphic ui
postAcceptBrowseFor: aHierarchyBrowser 
	(aHierarchyBrowser selectedClass ~= self selectedClass or: [ aHierarchyBrowser selectedMessageName notNil ]) ifTrue: [ self selectMessageCategoryNamed: nil ].
	aHierarchyBrowser instanceMessagesIndicated
		ifTrue: [ self indicateInstanceMessages ]
		ifFalse: [ self indicateClassMessages ].
	self
		 selectClass: aHierarchyBrowser selectedClass ;
		 selectedMessageName: aHierarchyBrowser selectedMessageName ;
		 showHomeCategory