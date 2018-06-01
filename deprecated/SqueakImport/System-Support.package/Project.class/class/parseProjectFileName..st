squeaklet on server
parseProjectFileName: aString
	"It was formerly possible to have periods in projct names and this messed up some parsing methods. Try to handle that more gracefully and allow for a change in scheme at a later time.
	ar 10/11/2000: Switch to a different version encoding scheme. The new scheme is
		baseName.NNN.ext
	where NNN is at least three digits wide and encodes the version in a human readable form.
	Examples:
		Project parseProjectFileName: 'My Project.007.pr'.
		Project parseProjectFileName: 'My.First.Project.042.prj'.
		Project parseProjectFileName: 'My Project.123456.p r o j e c t'.
	The 'dot' is determined on FileDirectory>>dot to compensate for platforms wishing to use something different from a period. Also allows parsing the former encoding of file using Base64 encoded versions of the form
	Project parseProjectFileName: 'aa.bb.cc|AQ.ss'
	"
	| suffix baseName version versionAndSuffix index tokens |
	"answer an array with: 
		1 = basic project name
		2 = version string
		3 = suffix (pr)"

	"First check for the old style versions"
	index := aString findLast:[:ch| ch = $|].
	index = 0 ifFalse:["Old style version"
		baseName := aString copyFrom: 1 to: index-1.
		versionAndSuffix := aString copyFrom: index+1 to: aString size.
		(versionAndSuffix occurrencesOf: $.) = 0 ifTrue: [^ #('no suffix')].
		version := versionAndSuffix copyUpTo: $..
		suffix := versionAndSuffix copyFrom: version size+1 to: versionAndSuffix size.
		"Decode Base64 encoded version"
		version isEmpty
			ifTrue:[version := 0]
			ifFalse:[version := Base64MimeConverter decodeInteger: version unescapePercents].
		^{baseName. version. suffix}].
	"New style versions"
	tokens := aString findTokens: FileDirectory dot.
	tokens size < 2 "Not even a single dot"
		ifTrue:[^{aString. 0. ''}].
	tokens size < 3 ifTrue:["Only one dot"
		self flag: #arNote. "We could allow project file names of the form 'project.001' (e.g., no project extension) or '.001.pr' (without a base name) but I don't think its a good idea."
		^{tokens first. 0. tokens last}].
	suffix := tokens last.
	version := tokens at: tokens size - 1.
	(version anySatisfy:[:ch| ch isDigit not]) ifTrue:[
		"Non-digit version??? I don't think so..."
		baseName := aString copyFrom: 1 to: aString size - suffix size - 1.
		^{baseName. 0. suffix}].
	baseName := aString copyFrom: 1 to: aString size - suffix size - version size - 2.
	version := version asInteger.
	^{baseName. version. suffix}