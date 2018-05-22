squeaklet on server
fromUrl: urlString
	"Load the project, and make a thumbnail to it in the current project.  Replace the old one if necessary.
To test it, make sure you don't have AAEmptyTest.001.pr in your Squeaklets directory. Then do:
Project fromUrl: 'http://209.143.91.36/super/SuperSwikiProj/AAEmptyTest.001.pr'.
The project should open and you should enter it. Return to the previous project and delete the project. Then do:
Project fromUrl: 'AAEmptyTest.001.pr'.
The project should open again - this time faster - and you should enter it. 
"
	| absoluteUrl projectFilename projName proj serverDir pair |
	Project canWeLoadAProjectNow ifFalse: [^ self].
	absoluteUrl := Url absoluteFromFileNameOrUrlString: urlString.
	projectFilename := absoluteUrl fileName.
	projName := (Project parseProjectFileName: projectFilename unescapePercents) first.
	(proj := Project named: projName) ifNotNil: [
		"it appeared"
		^ProjectEntryNotification signal: proj].

	serverDir := ServerDirectory serverForURL: absoluteUrl directoryUrl asString.
	serverDir ifNotNil: [
		pair := self mostRecent: projectFilename onServer: serverDir.
		"Pair first is name exactly as it is on the server"
		pair first ifNil: [^self current openBlankProjectNamed: projName].
		projectFilename := pair first].

	ProjectLoading
		installRemoteNamed: projectFilename
		from: absoluteUrl asString unescapePercents
		named: projName
		in: CurrentProject