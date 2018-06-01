accessing
fullPath: serverAndDirectory
	"Parse and save a full path.  Convention:  if ftp://user@server/dir, then dir is relative to user's directory.  dir has no slash at beginning.  If ftp://server/dir, then dir is absolute to top of machine, give dir a slash at the beginning."

	| start bare sz userAndServer both slash score best |
	bare := serverAndDirectory.
	sz := serverAndDirectory size.
	bare size > 0 ifTrue: [ 
		start := (bare copyFrom: 1 to: (8 min: sz)) asLowercase.
		((start beginsWith: 'ftp:') or: [start beginsWith: 'nil:']) "fix bad urls"
			ifTrue: [type := #ftp.
				bare := bare copyFrom: (7 min: sz) to: bare size].
		(start beginsWith: 'http:') 
			ifTrue: [type := #http.
				bare := bare copyFrom: (8 min: sz) to: serverAndDirectory size].
		((start beginsWith: 'file:') or: [type == #file])
			ifTrue: [type := #file.
				urlObject := FileUrl absoluteFromText: serverAndDirectory.
				^ self]].
	userAndServer := bare copyUpTo: self pathNameDelimiter.
	both := userAndServer findTokens: '@'.
	slash := both size.	"absolute = 1, relative = 2"
	server := both last.
	both size > 1 ifTrue: [user := both at: 1].
	bare size > (userAndServer size + 1) 
		ifTrue: [directory := bare copyFrom: userAndServer size + slash to: bare size]
		ifFalse: [directory := ''].

	"If this server is already known, copy in its userName and password"
	type == #ftp ifFalse: [^ self].
	score := -1.
	ServerDirectory serverNames do: [:name | | match sd |
		sd := ServerDirectory serverNamed: name.
		server = sd server ifTrue: [
			match := directory asLowercase charactersExactlyMatching: sd directory asLowercase.
			match > score ifTrue: [score := match.  best := sd]]].
	best ifNil: [
		self fromUser
	] ifNotNil: [
		user := best user.
		altURL := best altUrl.
		loaderUrl := best loaderUrl.
		self password: best password
	].
