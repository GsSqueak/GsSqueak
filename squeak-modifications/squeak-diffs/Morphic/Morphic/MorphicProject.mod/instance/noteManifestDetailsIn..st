file in/out
noteManifestDetailsIn: manifestInfo
	"The receiver is a project being loaded.  From the dictionary provided, absorb and remember whether it's an 'old' (pre-olpc) project, and remember the GUID, user, and prev-GUID associated with the project when these data are available in the incoming manifest."

	| manifestDict oldProject |
	manifestInfo isEmptyOrNil ifTrue: [^ self projectParameterAt: #oldProject put: true].

	manifestDict := (manifestInfo isKindOf: Dictionary) ifTrue: [manifestInfo] ifFalse: [manifestInfo first].

	oldProject := ((manifestDict at: 'Squeak-Version' ifAbsent: ['']) beginsWith: 'etoys') not.
	self projectParameterAt: #oldProject put: oldProject.

	manifestDict at: #URI ifPresent: [:aUri | self projectParameterAt: #URI put: aUri].
	manifestDict at: #user ifPresent: [:aUser | self projectParameterAt: #user put: aUser].
	manifestDict at: #'prev-URI' ifPresent: [:aUri | self projectParameterAt: #'prev-URI' put: aUri]