I am a model for a modal dialog akin to "Standard File Services" on various modern GUI operating systems.  My protocol includes some methods to maintain upward compatibility with StandardFileMenu, which I hope to replace.

Sample doIts:

	"StandardFileDialog getFolder"-- ask user to select folder, answer corresponding FileDirectory
	"StandardFileDialog getFile"	-- ask user to select file, answer corresponding FileStream
	"StandardFileDialog putFile"	-- ask user to create new file, answer FileStream

  In addition to the instance variables inhereted from FileList, of which I am a subclass, I am pluggable via the following instance variables:

prompt			<String>
	Display a prompt between the buttons.

resultBlock		<BlockClosure>
	Passed a file directory and a file name, answer the result to be answered by the dialog.	

canAcceptBlock	<BlockClosure>	
	Answer whether the accept button should be "active"

fileFilterBlock	<BlockClosure>	
	Passed a file directory entry, answer whether the entry should be added to the list.  The list can be further filtered (but not expanded) by the user through the pattern.

validateBlock	<BlockClosure>
	Passed a file directory entry, a file name and a collection of newly created files, answer whether the dialog selection is valid.  validateBlock is checked after the user has pressed accept, for example to ask if the user really meant to delete a file.

newFiles		<OrderedCollection>

	newFiles is an OrderedCollection of fileNames of files added by the user to the current directory since the user last entered same