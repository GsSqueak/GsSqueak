instance creation
addMVC: theme
	"
	self create apply.
	"
	theme
		derive: #color for: #ListView from: #PluggableListMorph;
		derive: #borderColor for: #ListView from: #PluggableListMorph at: #textColor;
		
		derive: #color for: #StringHolderView from: #PluggableTextMorph;
		derive: #borderColor for: #StringHolderView from: #PluggableTextMorph at: #textColor;
		
		derive: #color for: #PluggableButtonView from: #PluggableButtonMorph;
		derive: #borderColor for: #PluggableButtonView from: #PluggableButtonMorph at: #textColor;
		derive: #font for: #PluggableButtonView from: #PluggableButtonMorph;
		
		derive: #color for: #PopUpMenu from: #MenuMorph;
		derive: #borderColor for: #PopUpMenu from: #MenuMorph;
		derive: #textColor for: #PopUpMenu from: #MenuItemMorph;
		derive: #lineColor for: #PopUpMenu from: #MenuMorph at: #borderColor;
		
		set: #borderColorModifier for: #StandardSystemView to: [ [:c | c adjustBrightness: -0.5] ].