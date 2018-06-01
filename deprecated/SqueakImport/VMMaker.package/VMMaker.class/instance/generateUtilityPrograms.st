generate sources
generateUtilityPrograms
	"Any additional sources not directly part of the VM may be generated here"

	Smalltalk
		at: #ImageFormat
		ifPresent: [:cls |  "generate ckformat utility program"
			cls storeCkstatusOnFile: (self sourceDirectory fullNameFor: 'ckformat.c')]