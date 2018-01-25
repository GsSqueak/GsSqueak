Nebraska support
remoteCanvasesDo: aBlock 	remoteServer		ifNil: [^ self].	^ remoteServer clients		do: [:client | aBlock value: client canvas]