This morph incorporates tiling and regular motion with the intent of supporting, eg, panning of endless (toroidal) backgrounds.

The idea is that embedded morphs get displayed at a moving offset relative to my position.  Moreover this display is tiled according to the bounding box of the submorphs (subBounds), as much as necesary to fill the rest of my bounds.