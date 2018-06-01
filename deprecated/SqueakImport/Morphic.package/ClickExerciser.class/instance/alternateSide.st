initialization
alternateSide
"initial extent is square. We return an alternate height/width for drag to manipulate."
^ (self defaultSide asFloat * 1.618) rounded .
