world state
installFlaps
	"Get flaps installed within the bounds of the receiver"

	| localFlapTabs |
	Project current assureFlapIntegrity.
	self addGlobalFlaps.
	localFlapTabs := self localFlapTabs.
	localFlapTabs do: [:each | each visible: false].

	Preferences eToyFriendly ifTrue: [
		ProgressInitiationException display: 'Building Viewers...' translated
			during: [:bar |
				localFlapTabs keysAndValuesDo: [:i :each |
					each adaptToWorld.
					each visible: true.
					each unhibernate.
					self displayWorld.
					bar value: i / self localFlapTabs size]].
	] ifFalse: [
		localFlapTabs keysAndValuesDo: [:i :each |
			each adaptToWorld.
			each visible: true.
			self displayWorld]].

	self assureFlapTabsFitOnScreen.
	self bringTopmostsToFront