security operations
enterRestrictedMode
	"Some insecure contents was encountered. Close all doors and proceed."
	self isInRestrictedMode ifTrue:[^true].
	Preferences securityChecksEnabled ifFalse:[^true]. "it's been your choice..."
	Preferences warnAboutInsecureContent ifTrue:[
		( UIManager default chooseFrom: #('Load it anyways' 'Do not load it')
			title: 
'You are about to load some insecure content.
If you continue, access to files as well as
some other capabilities will be limited.')
			 = 1 ifFalse:[
				"user doesn't really want it"
				^false.
			].
	].
	"here goes the actual restriction"
	self flushSecurityKeys.
	self disableFileAccess.
	self disableImageWrite.
	"self disableSocketAccess."
	FileDirectory setDefaultDirectory: self untrustedUserDirectory.
	^true
