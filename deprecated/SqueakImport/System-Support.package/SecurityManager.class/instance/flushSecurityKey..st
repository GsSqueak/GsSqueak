initialize-release
flushSecurityKey: aKey
	"Flush a security key"
	| n |
	n := aKey first.
	1 to: n basicSize do:[:i| n basicAt: i put: 0].
	n := aKey second.
	1 to: n basicSize do:[:i| n basicAt: i put: 0].
