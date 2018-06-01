for real
updateProjectInfoFor: aProject

	| data details projectLinks linkString uploader |

	data := OrderedCollection new.
	data add: 'action: updatepage'.
	data add: 'password: ',ProjectPasswordNotification signal.
	data add: 'projectimage: ', (aProject name convertToEncoding: self encodingName) , '.gif'.
	uploader := Utilities authorNamePerSe.
	uploader isEmptyOrNil ifTrue: [uploader := Utilities authorInitialsPerSe].
	uploader isEmptyOrNil ifFalse: [
		data add: ('submittedBy: ',uploader convertToEncoding: self encodingName).
	].
	projectLinks := Set new.
	aProject world allMorphsDo: [ :each |
		(each isKindOf: ProjectViewMorph) ifTrue: [
			projectLinks add: each safeProjectName.
		].
	].
	details := aProject world valueOfProperty: #ProjectDetails ifAbsent: [Dictionary new].
	details at: 'projectname' ifAbsentPut: [aProject name].
	projectLinks isEmpty ifTrue: [
		details removeKey: 'projectlinks' ifAbsent: []
	] ifFalse: [
		linkString := String streamContents: [ :strm |
			projectLinks sorted do: [ :each |
				strm nextPutAll: each
			] separatedBy: [
				strm nextPut: $.
			].
		].
		details at: 'projectlinks' put: linkString
	].
	details keysAndValuesDo: [ :k :v |
		data add: k , ': ' , (v convertToEncoding: self encodingName). self flag: #yoFlag.
	].
	^self sendToSwikiProjectServer: data