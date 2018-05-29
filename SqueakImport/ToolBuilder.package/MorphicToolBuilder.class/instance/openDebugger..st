opening
openDebugger: aSpec

	| morph |
	morph := self build: aSpec.
	morph openInWorld: Project current world extent: morph extent.
	^ morph