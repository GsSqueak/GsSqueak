*SqClasses-*SqClasses-*SqClasses-class initialization
initializeShutDownList
	"SmalltalkImage initialize"

	| oldList |
	oldList := ShutDownList.
	ShutDownList := OrderedCollection new.
	"These get processed from the bottom up..."
	#(
		Delay
		DisplayScreen
		EventSensor
		Form
		ControlManager
		PasteUpMorph
		StrikeFont
		Color
		FileDirectory
		SoundPlayer
		HttpUrl
		Password
		PWS
		MailDB
		ImageSegment
	) do:[:clsName|
		Smalltalk at: clsName ifPresent:[:cls| Smalltalk addToShutDownList: cls].
	].

	oldList ifNotNil: [oldList reverseDo: [:className | Smalltalk at: className
						ifPresent: [:theClass | Smalltalk addToShutDownList: theClass]]].
