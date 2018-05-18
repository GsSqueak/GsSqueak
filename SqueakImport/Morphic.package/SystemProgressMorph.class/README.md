An single instance of this morph class is used to display progress while the system is busy, eg. while it receives code updates or does a fileIn. To give the user progress information you don't deal directly with SystemProgressMorph. You keep on using the well established way of progress notification, that has been a long time in the system, is widely used and does not depend on the existence of SystemProgressMorph. For more information on this look at the example in this class or look at the comment of the method displayProgressAt:from:to:during: in class String.

SystemProgressMorph is not meant to be used as a component inside other morphs.

You can switch back to the old style of progress display by disabling the morphicProgressStyle setting in the morphic section of the preferences.