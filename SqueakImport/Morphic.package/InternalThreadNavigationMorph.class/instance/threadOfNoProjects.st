navigation
threadOfNoProjects

	| nameList nav |

	nameList := { {Project current name} }.
	nav := self class basicNew.
	nav
		listOfPages: nameList;
		threadName: '' index: nil;
		initialize.
	nav editThisThread.
