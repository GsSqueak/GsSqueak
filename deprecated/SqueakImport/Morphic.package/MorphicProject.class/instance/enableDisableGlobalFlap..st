flaps support
enableDisableGlobalFlap: aFlapTab
	"For the benefit of pre-existing which-global-flap buttons from a design now left behind."

	self flag: #toRemove.
	^ self inform: 
'Sorry, this is an obsolete menu; please
dismiss it and get a fresh menu.  Thanks.'.