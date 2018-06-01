file in/out
writeFileNamed: localFileName fromDirectory: localDirectory toServer: primaryServerDirectory

	| local resp gifFileName f |

	local := localDirectory oldFileNamed: localFileName.
	resp := primaryServerDirectory upLoadProject: local named: localFileName resourceUrl: self resourceUrl retry: false.
	local close.
	resp == true ifFalse: [
		"abandon resources that would've been stored with the project"
		self resourceManager abandonResourcesThat:
			[:loc| loc urlString beginsWith: self resourceUrl].
		self error: 'the primary server of this project seems to be down (',
							resp printString,')'. 
		^ self
	].

	gifFileName := self name,'.gif'.
	localDirectory deleteFileNamed: gifFileName ifAbsent: [].
	local := localDirectory fileNamed: gifFileName.
	thumbnail ifNil: [
		(thumbnail := Form extent: 100@80) fillColor: Color orange
	] ifNotNil: [
		thumbnail unhibernate.
	].
	f := thumbnail colorReduced.  "minimize depth"
	f depth > 8 ifTrue: [
		f := thumbnail asFormOfDepth: 8
	].
	GIFReadWriter putForm: f onStream: local.
	local close.

	[local := StandardFileStream readOnlyFileNamed: (localDirectory fullNameFor: gifFileName).
	(primaryServerDirectory isKindOf: FileDirectory)
		ifTrue: [primaryServerDirectory deleteFileNamed: gifFileName ifAbsent: []].
	primaryServerDirectory putFile: local named: gifFileName retry: false.
	] on: Error do: [:ex |].
	local close.

	primaryServerDirectory updateProjectInfoFor: self.
	primaryServerDirectory sleep.	"if ftp, close the connection"
