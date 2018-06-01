sound generation
processTempoMapAtTick: scoreTick
	"Process tempo changes through the given score tick."

	| map tempoChanged |
	map := score tempoMap.
	map ifNil: [^ self].
	tempoChanged := false.
	[(tempoMapIndex <= map size) and:
	 [(map at: tempoMapIndex) time <= scoreTick]] whileTrue: [
		tempoChanged := true.
		tempoMapIndex := tempoMapIndex + 1].

	tempoChanged ifTrue: [
		tempo := (120.0 * (500000.0 / (map at: tempoMapIndex - 1) tempo)) roundTo: 0.01.
		self tempoOrRateChanged].

