initialization
initialize
	Smalltalk 
		at: #MczInstaller
		ifPresent: [:installer | self adoptVersionInfoFrom: installer].

	"Squeak would move instances now. During GsSqueak bootstrap, there should be no instances"
	
	self registerForNotifications.
	Smalltalk addToStartUpList: self
