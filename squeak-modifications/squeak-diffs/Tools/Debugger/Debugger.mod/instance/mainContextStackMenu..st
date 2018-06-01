context stack menu
mainContextStackMenu: aMenu
	"Set up the menu appropriately for the context-stack-list, unshifted"
	<contextStackMenuShifted: false>
	^ aMenu addList: #(
			('fullStack (f)' 				fullStack) 
			('restart (r)' 				restart) 
			('proceed (p)' 				proceed) 
			('step (t)' 					doStep) 
			('step through (T)'	 		stepIntoBlock) 
			('send (e)' 					send) 
			('where (w)' 				where) 
			('peel to first like this' 		peelToFirst) 
			- 
			('return entered value' 		returnValue) 
			- 
			('toggle break on entry'	toggleBreakOnEntry) 
			('senders of    (n)' 			browseSendersOfMessages) 
			('implementors of    (m)' 	browseMessages) 
			('inheritance (i)' 			methodHierarchy) 
			- 
			('versions (v)' 				browseVersions) 
			- 
			('references    (r)' 			browseVariableReferences) 
			('assignments    (a)' 		browseVariableAssignments) 
			- 
			('class refs (N)' 				browseClassRefs) 
			('browse full (b)' 			browseMethodFull) 
			('file out ' 			 		fileOutMessage) 
			- 
			('mail out bug report' 		mailOutBugReport));
		yourself
