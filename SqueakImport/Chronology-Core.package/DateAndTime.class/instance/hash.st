ansi protocol
hash
	| totalSeconds |
	totalSeconds := seconds - self offset asSeconds.
	^ ((totalSeconds // 86400 + jdn) hashMultiply bitXor: totalSeconds \\
86400) bitXor: nanos