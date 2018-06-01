The fundamental user-scriptable entity.  Always represented by a user-specific subclass of Player; instance vars and methods relate to user-defined structures.

costume  is a Morph, the primary morph I am currently wearing for graphical display.

Scripts are defined in subclasses of Player.  These are UniClasses.

Messages in scripts are sent to Players.  A Player may delegate to its costume, or to an object the costume suggests.  Or, a Player may designate some other object to receive the script messages it does not understand. (see doesNotUnderstand:) 