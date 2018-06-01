accessing
trackInfo

	^ trackInfo ifNil: [tracks collect: [:i | String new]]
