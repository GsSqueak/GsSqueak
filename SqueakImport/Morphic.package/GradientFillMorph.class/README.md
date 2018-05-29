Class GradientFillMorph is obsolete. For getting gradient fills use a BorderedMorph with an appropriate fill style, e.g.,

	| morph fs |
	morph := BorderedMorph new.
	fs := GradientFillStyle ramp: {0.0 -> Color red. 1.0 -> Color green}.
	fs origin: morph bounds center.
	fs direction: (morph bounds width // 2) @ 0.
	fs radial: true.
	morph fillStyle: fs.
	Project current world primaryHand attachMorph: morph.

Here's the old (obsolete) comment:
GradientFills cache an array of bitpatterns for the colors across their rectangle.  It costs a bit of space, but makes display fast enough to eschew the use of a bitmap.  The array must be recomputed whenever the colors, dimensions or display depth change.