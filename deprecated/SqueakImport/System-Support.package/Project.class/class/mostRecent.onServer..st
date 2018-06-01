squeaklet on server
mostRecent: projName onServer: aServerDirectory
	| stem list max goodName triple num stem1 stem2 rawList nothingFound unEscName |
	"Find the exact fileName of the most recent version of project with the stem name of projName.  Names are of the form 'projName|mm.pr' where mm is a mime-encoded integer version number.
	File names may or may not be HTTP escaped, %20 on the server."

	self flag: #bob.		"do we want to handle unversioned projects as well?"
						"I think we do now - Yoshiki."

	nothingFound := {nil. -1}.
	aServerDirectory ifNil: [^nothingFound].
	"23 sept 2000 - some old projects have periods in name so be more careful"
	unEscName := projName unescapePercents.
	triple := Project parseProjectFileName: unEscName.
	stem := triple first.
	rawList := aServerDirectory fileNames.

	rawList isString ifTrue: [self inform: 'server is unavailable' translated. ^nothingFound].
	list := rawList collect: [:nnn | nnn unescapePercents].
	max := -1.  goodName := nil.
	list withIndexDo: [:aName :ind |
		((aName beginsWith: stem)) ifTrue: [
			((aName endsWith: triple last) or: [triple last = '' and: [aName endsWith: '.pr']]) ifTrue: [
			num := (Project parseProjectFileName: aName) second.
			num > max ifTrue: [max := num.  goodName := (rawList at: ind)]]]].

	max = -1 ifFalse: [^ Array with: goodName with: max].

	"try with underbar for spaces on server"
	(stem includes: $ ) ifTrue: [
		stem1 := stem copyReplaceAll: ' ' with: '_'.
		list withIndexDo: [:aName :ind |
			(aName beginsWith: stem1) ifTrue: [
				num := (Project parseProjectFileName: aName) second.
				num > max ifTrue: [max := num.  goodName := (rawList at: ind)]]]].
	max = -1 ifFalse: [^ Array with: goodName with: max].
	
	"try without the marker | "
	stem1 := stem allButLast, '.pr'.
	stem2 := stem1 copyReplaceAll: ' ' with: '_'.	"and with spaces replaced"
	list withIndexDo: [:aName :ind |
		(aName beginsWith: stem1) | (aName beginsWith: stem2) ifTrue: [
			(triple := aName findTokens: '.') size >= 2 ifTrue: [
				max := 0.  goodName := (rawList at: ind)]]].	"no other versions"
	max = -1 ifFalse: [^ Array with: goodName with: max].

	^nothingFound		"no matches"
