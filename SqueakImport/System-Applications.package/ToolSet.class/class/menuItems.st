menu
menuItems
	"Answer the menu items available for this tool set"
	self default ifNil:[^#()].
	^self default menuItems