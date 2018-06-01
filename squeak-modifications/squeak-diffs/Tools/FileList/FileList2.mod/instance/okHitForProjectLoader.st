private
okHitForProjectLoader

	| areaOfProgress |
	fileName ifNil: [^ self].
	ok := true.
	areaOfProgress := modalView firstSubmorph.
	[
		areaOfProgress setProperty: #deleteOnProgressCompletion toValue: modalView.
		self openProjectFromFile.
		modalView delete.	"probably won't get here"
	]
		on: ProgressTargetRequestNotification
		do: [ :ex | ex resume: areaOfProgress].


