menu
invokeMenu
	"Invoke a menu of additonal functions for this WaveEditor."

	| aMenu |
	aMenu := MenuMorph new.
	aMenu addList:	{
		{'play straight through' translated.	#play}.
		{'play before cursor' translated.	#playBeforeCursor}.
		{'play after cursor' translated.		#playAfterCursor}.
		{'play test note' translated.			#playTestNote}.
		{'play loop' translated.				#playLoop}.
		{'trim before cursor' translated.	#trimBeforeCursor}.
		{'trim after cursor' translated.		#trimAfterCursor}.
		{'choose loop start' translated.		#chooseLoopStart}.
		{'jump to loop start' translated.		#jumpToLoopStart}.
		{'jump to loop end' translated.		#jumpToLoopEnd}.
		{'make unlooped' translated.		#setUnlooped}.
		{'make unpitched' translated.		#setUnpitched}.
		{'show envelope' translated.		#showEnvelope}.
		{'show FFT' translated.				#showFFTAtCursor}}.
	aMenu invokeModal.