layout
laySubpartsOutInOneRow
	| aPosition |
	aPosition := 0 @ padding.
	submorphs do:
	[:aMorph |
		aMorph position: (aPosition + (padding @ 0)).
		aPosition := aMorph topRight]