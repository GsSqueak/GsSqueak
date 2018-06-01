-services-base
codePaneMenuServices: aMenu 
	ServiceGui browser: self codePaneMenu: aMenu.
	^ Preferences useOnlyServicesInMenu
		ifFalse: [aMenu]