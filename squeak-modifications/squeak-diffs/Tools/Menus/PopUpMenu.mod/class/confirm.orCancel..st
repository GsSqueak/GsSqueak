dialogs
confirm: queryString orCancel: cancelBlock 
	"Put up a yes/no/cancel menu with caption aString. Answer 
	true if  
	the response is yes, false if no. If cancel is chosen, evaluate  
	cancelBlock. This is a modal question--the user must respond 
	yes or no."
	"PopUpMenu confirm: 'Reboot universe' orCancel: 
	[^'Nevermind'] "
	| menu choice |
	menu := PopUpMenu labelArray: {'Yes' translated. 'No' translated. 'Cancel' translated}.
	choice := menu startUpWithCaption: queryString icon: MenuIcons confirmIcon.
	choice = 1
		ifTrue: [^ true].
	choice = 2
		ifTrue: [^ false].
	^ cancelBlock value