menu support
addIndividualGlobalFlapItemsTo: aMenu 
	"Add items governing the enablement of specific global flaps to aMenu"
	self globalFlapTabsIfAny
		do: [:aFlapTab | 
			| anItem |
			anItem := aMenu
						addUpdating: #globalFlapWithIDEnabledString:
						enablementSelector: #showSharedFlaps
						target: self
						selector: #enableDisableGlobalFlapWithID:
						argumentList: {aFlapTab flapID}.
			anItem wordingArgument: aFlapTab flapID.
			anItem setBalloonText: aFlapTab balloonTextForFlapsMenu]