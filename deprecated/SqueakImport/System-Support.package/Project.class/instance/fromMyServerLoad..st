file in/out
fromMyServerLoad: otherProjectName
	| pair pr dirToUse |
	"If a newer version of me is on the server, load it."

	(pr := Project named: otherProjectName) ifNotNil: ["it appeared"
		^ pr enter
	].

	dirToUse := self primaryServerIfNil: [
		lastDirectory
			ifNil: [FileDirectory default]
			ifNotNil: [lastDirectory]].

	pair := self class mostRecent: otherProjectName onServer: dirToUse.
	pair first ifNil: [^self decideAboutCreatingBlank: otherProjectName].	"nothing to load"
	^ProjectLoading
		installRemoteNamed: pair first
		from: dirToUse
		named: otherProjectName
		in: self

