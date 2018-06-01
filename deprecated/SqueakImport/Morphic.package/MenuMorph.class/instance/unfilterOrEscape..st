keyboard control
unfilterOrEscape: evt 
	self valueOfProperty: #matchString
		ifPresentDo: 
			[:str | 
			
			str isEmpty 
				ifFalse: 
					["If filtered, first ESC removes filter"

					self setProperty: #matchString toValue: String new.
					self selectItem: nil event: evt.
					self displayFiltered: evt]].
	"If a stand-alone menu, just delete it"
	popUpOwner ifNil: [^self delete].
	"If a sub-menu, then deselect, and return focus to outer menu"
	self selectSuperMenu: evt