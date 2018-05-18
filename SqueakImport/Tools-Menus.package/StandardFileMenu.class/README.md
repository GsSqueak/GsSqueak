I represent a SelectionMenu which operates like a modal dialog for selecting files, somewhat similar to the StandardFile dialogs in MacOS and Java Swing.

Try for example, the following:

	StandardFileMenu oldFile inspect

	StandardFileMenu oldFileStream inspect

	StandardFileMenu newFile inspect

	StandardFileMenu newFileStream inspect
	
	(StandardFileMenu oldFileMenu: FileDirectory default withPattern: '*') startUpWithCaption: 'Select a file:'
	
	(StandardFileMenu oldFileMenu: (FileDirectory default) withPatternList: {'*.txt'. '*.changes'}) startUpWithCaption: 'Select a file:'
