standard file operations
oldFileFrom: aDirectory withPattern: aPattern
"
Select an existing file from a selection conforming to aPattern.
"
	^(self oldFileMenu: aDirectory withPattern: aPattern)
		startUpWithCaption: 'Select a File:' translated