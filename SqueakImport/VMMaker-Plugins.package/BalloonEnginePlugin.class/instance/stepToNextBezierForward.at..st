beziers-simple
stepToNextBezierForward: updateData at: yValue
	"Incrementally step to the next scan line in the given bezier update data."
	| minY lastX lastY fwDx fwDy |
	<inline: true>
	<var: #updateData type: 'int *'>
	lastX := updateData at: GBUpdateX.
	lastY := updateData at: GBUpdateY.
	fwDx := updateData at: GBUpdateDX.
	fwDy := updateData at: GBUpdateDY.
	minY := yValue * 256.
	"Step as long as we haven't yet reached minY and also
	as long as fwDy is greater than zero thus stepping down.
	Note: The test for fwDy should not be necessary in theory
		but is a good insurance in practice."
	[minY > lastY and:[fwDy >= 0]] whileTrue:[
		lastX := lastX + ((fwDx + 16r8000) // 16r10000).
		lastY := lastY + ((fwDy + 16r8000) // 16r10000).
		fwDx := fwDx + (updateData at: GBUpdateDDX).
		fwDy := fwDy + (updateData at: GBUpdateDDY).
	].
	updateData at: GBUpdateX put: lastX.
	updateData at: GBUpdateY put: lastY.
	updateData at: GBUpdateDX put: fwDx.
	updateData at: GBUpdateDY put: fwDy.
	^lastX // 256
