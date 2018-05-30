protocol
getWorkingDirectory
	| dirList |
	self openPassiveDataConnection.
	self sendCommand: 'PWD'.
	dirList := self getData.
	self checkResponse.
	self checkResponse.
	^dirList
