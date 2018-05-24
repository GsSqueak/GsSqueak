reading
beginReference: anObject
	"Remember anObject as the object we read at the position recorded by
	 noteCurrentReference:. This must be done after instantiating anObject but
	 before reading any of its contents that might (directly or indirectly) refer to
	 it. (It's ok to do this redundantly, which is convenient for #next.)
	 Answer the reference position."

	objects at: currentReference ifAbsent: [
		objects at: currentReference put: anObject.
		^ currentReference].
	(skipping includes: currentReference) ifFalse: [
		"If reading just to skip it, don't record this copy."
		objects at: currentReference put: anObject
	].
	^ currentReference		"position relative to start of data portion of file"