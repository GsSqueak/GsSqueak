accessing
objectForDataStream: refStream fromForm: aForm
	"Return a replacement for aForm to be stored instead"
	| stub fName copy loc fullSize nameAndSize |

	"First check if the form is one of the intrinsic Squeak forms"
	stub := internalStubs at: aForm ifAbsent:[nil].
	stub ifNotNil:[
		refStream replace: aForm with: stub. 
		^stub].

	"Now see if we have created the stub already 
	(this may happen if for instance some form is shared)"
	stub := originalMap at: aForm ifAbsent:[nil].
	stub ifNotNil:[^aForm].
	aForm hibernate.
	aForm bits class == FormStub ifTrue:[^nil].	"something is wrong"
	"too small to be of interest"
	"(aForm bits byteSize < 4096) ifTrue:[^aForm]."
	"We'll turn off writing out forms until we figure out how to reliably deal with resources"
	true ifTrue: [^aForm].

	"Create our stub form"
	stub := FormStub 
		extent: (aForm width min: 32) @ (aForm height min: 32) 
		depth: (aForm depth min: 8).
	aForm displayScaledOn: stub.
	aForm hibernate.

	"Create a copy of the original form which we use to store those bits"
	copy := Form extent: aForm extent depth: aForm depth bits: nil.
	copy setResourceBits: aForm bits.

	"Get the locator for the form (if we have any)"
	loc := locatorMap at: aForm ifAbsent:[nil].

	"Store the resource file"
	nameAndSize := self writeResourceForm: copy locator: loc.
	fName := nameAndSize first.
	fullSize := nameAndSize second.

	ProgressNotification signal: '2:resourceFound' extra: stub.
	stub hibernate.
	"See if we need to assign a new locator"
	(loc notNil and:[loc hasRemoteContents not]) ifTrue:[
		"The locator describes some local resource. 
		If we're preparing to upload the entire project to a
		remote server, make it a remote URL instead."
"		(baseUrl isEmpty not and:[baseUrl asUrl hasRemoteContents])
			ifTrue:[loc urlString: baseUrl, fName].
"
		baseUrl isEmpty not
			ifTrue:[loc urlString: self resourceDirectory , fName]].

	loc ifNil:[
		loc := ResourceLocator new urlString: self resourceDirectory , fName.
		locatorMap at: aForm put: loc].
	loc localFileName: (localDirectory fullNameFor: fName).
	loc resourceFileSize: fullSize.
	stub locator: loc.

	"Map old against stub form"
	aForm setResourceBits: stub.
	originalMap at: aForm put: copy.
	stubMap at: stub put: aForm.
	locatorMap at: aForm put: loc.
	"note: *must* force aForm in out pointers if 
	in IS or else won't get #comeFullyUpOnReload:"
	refStream replace: aForm with: aForm.
	^aForm