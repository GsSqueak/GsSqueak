squeaklet on server
namedUrl: urlString
	| projName |
	"Return project if in, else nil"

	"Ted's fix for unreachable projects"

	projName := (urlString findTokens: '/') last.
	projName := (Project parseProjectFileName: projName unescapePercents) first.
	^ Project named: projName
