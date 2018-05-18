undo
reintroduceIntoWorld: aMorph
	"The given morph is being raised from the dead.  Bring it back to life."

	(aMorph valueOfProperty: #lastPosition) ifNotNil:
		[:pos | aMorph position: pos].
	aMorph openInWorld; goHome

	