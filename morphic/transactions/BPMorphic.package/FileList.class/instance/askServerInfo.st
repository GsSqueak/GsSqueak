server list
askServerInfo
	"Get the user to create a ServerDirectory for a new server. Fill in and
	say Accept."
	| _gsSqueakTemp_template |
	_gsSqueakTemp_template := '"Please fill in the following info, then select all text and choose DoIt."

	| aa | 
	self flag: #ViolateNonReferenceToOtherClasses.
	aa := ServerDirectory new.
	aa server: ''st.cs.uiuc.edu''.    "host"
	aa user: ''anonymous''.
	aa password: ''yourEmail@school.edu''.
	aa directory: ''/Smalltalk/Squeak/Goodies''.
	aa url: ''''.    "<- this is optional.  Only used when *writing* update files."
	ServerDirectory addServer: aa named: ''UIUCArchive''.  "<- known by this name in Squeak"'.
	(StringHolder new contents: _gsSqueakTemp_template)
		openLabel: 'FTP Server Form'