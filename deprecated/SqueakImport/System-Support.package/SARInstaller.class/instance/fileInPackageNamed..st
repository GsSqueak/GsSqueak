client services
fileInPackageNamed: memberName 
	"This is to be used from preamble/postscript code to file in zip 
	members as DVS packages."
	| member current new baseName imagePackageLoader packageInfo streamPackageLoader packageManager |
	member := self zip memberNamed: memberName.
	member ifNil: [ ^self errorNoSuchMember: memberName ].

	imagePackageLoader := Smalltalk at: #ImagePackageLoader ifAbsent: [].
	streamPackageLoader := Smalltalk at: #StreamPackageLoader ifAbsent: [].
	packageInfo := Smalltalk at: #PackageInfo ifAbsent: [].
	packageManager := Smalltalk at: #FilePackageManager ifAbsent: [].

	"If DVS isn't present, do a simple file-in"
	(packageInfo isNil or: [imagePackageLoader isNil or: [streamPackageLoader isNil]])
		ifTrue: [ ^ self fileInMemberNamed: memberName ].

	baseName := memberName copyReplaceAll: '.st' with: ''.
	(packageManager allManagers anySatisfy: [ :pm | pm packageName = baseName ])
		ifTrue: [
			current := imagePackageLoader new package: (packageInfo named: baseName).
			new := streamPackageLoader new stream: member contentStream ascii.
			(new changesFromBase: current) fileIn ]
		ifFalse: [ self class fileIntoChangeSetNamed: baseName fromStream: member contentStream ascii setConverterForCode. ].

	packageManager registerPackage: baseName.

	self installed: member.