menus
transferStateToRenderer: aRenderer
	"Transfer knownName, actorState, visible, and player info over to aRenderer, which is being imposed above me as a transformation shell"

	| current |
	(current := self actorStateOrNil) ifNotNil:
		[aRenderer actorState: current.
		self actorState: nil].

	(current := self knownName) ifNotNil:
		[aRenderer setNameTo: current.
		self setNameTo: nil].

	(current := self player) ifNotNil:
		[aRenderer player: current.
		self player rawCostume: aRenderer.
		"NB player is redundantly pointed to in the extension of both the renderer and the rendee; this is regrettable but many years ago occasionally people tried to make that clean but always ran into problems iirc"
		"self player: nil"].

	aRenderer simplySetVisible: self visible



 

		