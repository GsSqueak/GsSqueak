navigation
threadOfAllProjects

	| nameList nav |

	nameList := Project allMorphicProjects collect: [ :each | {each name}].
	nav := self class basicNew.
	nav
		listOfPages: nameList;
		threadName: '' index: nil;
		initialize.
	nav editThisThread.
