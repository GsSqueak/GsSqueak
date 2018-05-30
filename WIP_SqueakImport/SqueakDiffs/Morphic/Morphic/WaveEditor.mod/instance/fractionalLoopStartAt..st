other
fractionalLoopStartAt: index
	"Answer the fractional index starting point near the given integral index that results in the closest match with the cycle following the loop end."
	"Note: could do this more efficiently by sliding downhill on the error curve to find lowest error."

	| oneCycle w1 minErr w2 err bestIndex |
	oneCycle := (samplingRate / perceivedFrequency) rounded.
	w1 := self interpolatedWindowAt: loopEnd + 1 width: oneCycle.
	minErr := SmallInteger maxVal.
	((index - 2) max: 1) to: ((index + 2) min: graph data size) by: 0.01 do: [:i |
		w2 := self interpolatedWindowAt: i width: oneCycle.
		err := self errorBetween: w1 and: w2.
		err < minErr ifTrue: [
			bestIndex := i.
			minErr := err]].
	^ bestIndex
