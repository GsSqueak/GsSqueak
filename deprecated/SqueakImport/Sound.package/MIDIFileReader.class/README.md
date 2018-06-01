A reader for Standard 1.0 format MIDI files.
MIDI File Types:
	type 0 -- one multi-channel track
	type 1 -- one or more simultaneous tracks
	type 2 -- a number on independent single-track patterns

Instance variables:
	stream			source of MIDI data
	fileType			MIDI file type
	trackCount		number of tracks in file
	ticksPerQuarter	number of ticks per quarter note for all tracks in this file
	tracks			collects track data for non-empty tracks
	strings			collects all strings in the MIDI file
	tempoMap		nil or a MIDITrack consisting only of tempo change events
	trackStream		stream on buffer containing track chunk
	track			track being read
	activeEvents 	notes that have been turned on but not off
