*System-Changes-fileIn/Out
decodeStyle: runsObjData version: styleVersion
	"Decode the runs array from the ReferenceStream it is stored in."
	"Verify that the class mentioned have the same inst vars as we have now"

	| structureInfo |
	styleVersion = RemoteString currentTextAttVersion ifTrue: [
		"Matches our classes, no need for checking"
		^ (ReferenceStream on: runsObjData) next].
	structureInfo := RemoteString structureAt: styleVersion.	"or nil"
		"See SmartRefStream instVarInfo: for dfn"
	^ SmartRefStream read: runsObjData withClasses: structureInfo