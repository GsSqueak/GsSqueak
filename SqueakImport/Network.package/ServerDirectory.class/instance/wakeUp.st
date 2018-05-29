multi-action sessions
wakeUp
	"Start a multi-action session: Open for FTP and keep the connection open"

	self isTypeFTP
		ifTrue: [client := self openFTPClient].
	self keepAlive: true
