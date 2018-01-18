halos and balloon help
halo	(self outermostWorldMorph		ifNil: [^ nil]) haloMorphs		do: [:h | h target == self				ifTrue: [^ h]].	^ nil