read write
nextPut: anObject
	"Really write three objects: (version, class structure, object).  But only when called from the outside.  If any instance-specific classes are present, prepend their source code.  byteStream will be in fileOut format.
	You can see an analysis of which objects are written out by doing: 
	(SmartRefStream statsOfSubObjects: anObject)
	(SmartRefStream tallyOfSubObjects: anObject)
	(SmartRefStream subObjects: anObject ofClass: aClass)"

| info |
topCall == nil 
	ifTrue:
		[topCall := anObject.
		'Please wait while objects are counted' 
			displayProgressFrom: 0 to: 10
			during: [:bar | info := self instVarInfo: anObject].
		self appendClassDefns.	"For instance-specific classes"
		'Writing an object file'
			displayProgressFrom: 0 to: objCount*4	"estimate"
			during: [:bar |
				objCount := 0.
				progressBar := bar.
				self setStream: byteStream reading: false.
					"set basePos, but keep any class renames"
				super nextPut: ReferenceStream versionCode.
				super nextPut: info.
				super nextPut: anObject.		"<- the real writing"
				classInstVars size > 0 ifTrue: [super nextPut: classInstVars]].
					"Note: the terminator, $!, is not doubled inside object data"
		"references is an IDict of every object that got written"
		byteStream ascii.
		byteStream nextPutAll: '!'; cr; cr.
		byteStream padToEndWith: $ .	"really want to truncate file, but can't"
		topCall := progressBar := nil]	"reset it"
	ifFalse:
		[super nextPut: anObject.
		progressBar ifNotNil: [progressBar value: (objCount := objCount + 1)]].
		"return the argument - added by kwl"
	^ anObject
