misc menu items
recolorTabs
	"Prompt the user for new on and off colors for tabs"

	| onColor offColor |
	self inform: 'Choose the ''on'' color'.
	onColor := Color fromUser.

	self inform: 
'Okay, now please choose
the ''off'' color'.
	offColor := Color fromUser.

	tabsMorph highlightColor: onColor regularColor: offColor.
	currentPage ifNotNil:
		[tabsMorph highlightTabFor: currentPage]