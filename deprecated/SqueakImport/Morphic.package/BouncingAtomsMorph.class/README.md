This morph shows how an ideal gas simulation might work. When it gets step messages, it makes all its atom submorphs move along their velocity vectors, bouncing when they hit a wall. It also exercises the Morphic damage reporting and display architecture. Here are some things to try:

  1. Resize this morph as the atoms bounce around.
  2. In an inspector on this morph, evaluate "self addAtoms: 10."
  3. Try setting quickRedraw to false in invalidRect:. This gives the
     default damage reporting and incremental redraw. Try it for
     100 atoms.
  4. In the drawOn: method of AtomMorph, change drawAsRect to true.
  5. Create a HeaterCoolerMorph and embed it in the simulation. Extract
	it and use an inspector on it to evaluate "self velocityDelta: -5", then
     re-embed it. Note the effect on atoms passing over it.
