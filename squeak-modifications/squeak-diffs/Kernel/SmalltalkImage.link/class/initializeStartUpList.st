class initialization
initializeStartUpList
	"SmalltalkImage initialize"
	
	| oldList |
	oldList := StartUpList.
	StartUpList := OrderedCollection new.
	"These get processed from the top down..."
	self flag: #'revisit in Squeak 5.3'.
	#(
		SmallInteger
		Delay
		DisplayScreen
		Cursor
		EventSensor
		"ProcessorScheduler"  "Starts low space watcher and bkground."
		FileDirectory  "Enables file stack dump and opens sources."
		ShortIntegerArray
		ShortRunArray
		CrLfFileStream "Remove this in Squeak 5.3"
	) do:[:clsName|
		Smalltalk at: clsName ifPresent:[:cls| Smalltalk addToStartUpList: cls].
	].
	oldList ifNotNil: [oldList do: [:className | Smalltalk at: className
						ifPresent: [:theClass | Smalltalk addToStartUpList: theClass]]].
	#(
		ImageSegment
		PasteUpMorph
		ControlManager
	) do:[:clsName|
		Smalltalk at: clsName ifPresent:[:cls| Smalltalk addToStartUpList: cls].
	].
