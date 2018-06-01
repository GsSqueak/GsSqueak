A PianoRollScoreMorph displays a score such as a MIDIScore, and will scroll through it tracking the progress of a ScorePlayerMorph (from which it is usually spawned).

timeScale is in pixels per score tick.

Currently the ambient track (for synchronizing thumbnails, eg) is treated specially here and in the score.  This should be cleaned up by adding a trackType or something like it in the score.