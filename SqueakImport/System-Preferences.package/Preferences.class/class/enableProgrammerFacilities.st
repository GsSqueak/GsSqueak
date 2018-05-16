initialization - misc
enableProgrammerFacilities
	"Meant as a one-touch recovery from a #disableProgrammerFacilities call."
	"Preferences enableProgrammerFacilities"

	self enable: #cmdDotEnabled.
	self compileAccessorForPreferenceNamed: #cmdGesturesEnabled value: true. 
	self compileAccessorForPreferenceNamed: #cmdKeysInText value: true.
	self disable: #noviceMode.
	self enable: #warnIfNoSourcesFile.
	self enable: #warnIfNoChangesFile.