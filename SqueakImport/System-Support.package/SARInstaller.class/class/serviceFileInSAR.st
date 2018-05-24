class initialization
serviceFileInSAR
	"Answer a service for opening a changelist browser on a file"

	^ SimpleServiceEntry 
		provider: self 
		label: 'install SAR' translatedNoop
		selector: #installSAR:
		description: 'install this Squeak ARchive into the image.' translatedNoop
		buttonLabel: 'install' translatedNoop