flap mechanics
reinstateDefaultFlaps
	"Remove all existing 'standard' global flaps clear the global list, and and add fresh ones.  To be called by doits in updates etc.  This is a radical step, but it does *not* clobber non-standard global flaps or local flaps.  To get the effect of the *former* version of this method, call Flaps freshFlapsStart"

	"Flaps reinstateDefaultFlaps"
	self globalFlapTabsIfAny do:
		[:aFlapTab |
			({
				
				'Squeak' translated.
				'Menu' translated.
				'Widgets' translated.
				'Tools' translated.
				'Supplies' translated.
				
				'Objects' translated.
				'Navigator' translated
			  } includes: aFlapTab flapID) ifTrue:
				[self removeFlapTab: aFlapTab keepInList: false]].

	"The following reduces the risk that flaps will be created with variant IDs
		such as 'Stack Tools2', potentially causing some shared flap logic to fail."
		"Smalltalk garbageCollect."  "-- see if we are OK without this"

	self addStandardFlaps.
	"self disableGlobalFlapWithID: 'Scripting'.
	self disableGlobalFlapWithID: 'Objects'."
	self currentWorld addGlobalFlaps.
	self currentWorld reformulateUpdatingMenus.
