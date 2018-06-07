file in/out
tryToFindAServerWithMe

	| resp primaryServerDirectory |

	urlList isEmptyOrNil ifTrue: [urlList := parentProject urlList copy].
	[self primaryServer isNil] whileTrue: [
		resp := (UIManager default 
					chooseFrom: #('Try to find a server' 'Cancel')
					title: 'This project thinks it has never been on a server').
		resp ~= 1 ifTrue: [^ nil].
		(primaryServerDirectory := self findAFolderToLoadProjectFrom) ifNil: [^nil].
		self storeNewPrimaryURL: primaryServerDirectory downloadUrl.
	].
	^self primaryServer
