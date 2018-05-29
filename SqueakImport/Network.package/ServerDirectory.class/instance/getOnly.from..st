file directory
getOnly: nnn from: fileNameOnServer
	| file ff resp |
	"Use FTP to just capture the first nnn characters of the file.  Break the connection after that.  Goes faster for long files.  Return the contents, not a stream."

	self isTypeFile ifTrue: [
		file := self as: ServerFile.
		file fileName: fileNameOnServer.
		ff := FileStream oldFileOrNoneNamed: (file fileNameRelativeTo: self).
		^ ff next: nnn].
	self isTypeHTTP ifTrue: [
		resp := HTTPSocket httpGet: (self fullNameFor: fileNameOnServer) 
				accept: 'application/octet-stream'.
			"For now, get the whole file.  This branch not used often."
		^ resp truncateTo: nnn].
	
	^ self getOnlyBuffer: (String new: nnn) from: fileNameOnServer