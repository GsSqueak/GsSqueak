I implement one polyphonic channel of a 16-channel MIDI synthesizer. Many MIDI commands effect all the notes played on a particular channel, so I record the state for a single channel, including a list of notes currently playing.

This initial implementation is extremely spartan, having just enough functionality to play notes. Things that are not implemented include:

  1. program changes
  2. sustain pedal
  3. aftertouch (either kind)
  4. most controllers
  5. portamento
  6. mono-mode
