During recording, the EventRecorder subscribes to all events of the normal morphic hand, and saves them as they occur.

For replay, a second playback hand is created that reads events from the recorder and plays them back in the world.

The EventRecorder began with the work of Ted Kaehler and John Malone.  This was then signifcantly expanded by Leandro Caniglia and Valeria Murgia as a tutorial aid for the Morphic Wrapper project.

Since that time, I have...
Changed to a simple inboard array for the tape (event storage).
Provided the ability to condense linear mouse movement with interpolation at replay.
Made simple provisions for wrap-around of the millisecond clock.
Eliminated step methods in favor of using the processEvents cycle in the playback hand.
Provided a pause/resume mechanism that is capable of surviving project changes.
Added the ability to spawn a simple 'play me' button that can be saved as a morph.
Caused the playback hand to display its cursor double size for visibility.
Integrated a voice recorder with on-the-fly compression.
	This currently does NOT survive project changes, not is its data stored on the tape.
	Right now it can only be saved by saving the entire recorder as a morph.
	This will be fixed by adding a startSound event at each project change.
	We will also convert read/write file to use saveOnFile.
Added a journal file facility for recording sequences that end in a crash.
The above two features can be engaged via the ER's morph menu.
	- Dan Ingalls 3/6/99