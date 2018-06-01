construction
colorForEnvelope: env
	| name index |
	name := env name.
	index := #('volume' 'modulation' 'pitch' 'ratio') indexOf: name
				ifAbsent: [5].
	^ Color perform: (#(red green blue magenta black) at: index)