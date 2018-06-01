initialize-release
extendedMIMEdatabase
	| d |
	(d := self defaultMIMEdatabase) 
		 at: 'hqx' put: 'application/mac-binhex40';
		 at: 'cpt' put: 'application/mac-compactpro';
		 at: 'pdf' put: 'application/pdf';
		 at: 'ps' put: 'application/postscript';
		 at: 'ai' put: 'application/postscript';
		 at: 'eps' put: 'application/postscript';
		 at: 'rtf' put: 'text/rtf';
		 at: 'ics' put: 'text/calendar';
		 at: 'bin' put: 'application/octet-stream';
		 at: 'dms' put: 'application/octet-stream';
		 at: 'lha' put: 'application/octet-stream';
		 at: 'lzh' put: 'application/octet-stream';
		 at: 'exe' put: 'application/octet-stream';
		 at: 'class' put: 'application/octet-stream';
		 at: 'zip' put: 'application/zip';
		 at: 'gtar' put: 'application/x-gtar';
		 at: 'swf' put: 'application/x-shockwave-flash';
		 at: 'sit' put: 'application/x-stuffit';
		 at: 'tar' put: 'application/x-tar';
		 at: 'au' put: 'audio/basic';
		 at: 'snd' put: 'audio/basic';
		 at: 'mid' put: 'audio/midi';
		 at: 'midi' put: 'audio/midi';
		 at: 'mpga' put: 'audio/mpeg';
		 at: 'mp2' put: 'audio/mpeg';
		 at: 'mp3' put: 'audio/mpeg';
		 at: 'aiff' put: 'audio/x-aiff';
		 at: 'aif' put: 'audio/x-aiff';
		 at: 'aifc' put: 'audio/x-aiff';
		 at: 'rm' put: 'audio/x-pn-realaudio';
		 at: 'ram' put: 'audio/x-pn-realaudio';
		 at: 'rpm' put: 'audio/x-pn-realaudio-plugin';
		 at: 'ra' put: 'audio/x-realaudio';
		 at: 'wav' put: 'audio/x-wav';
		 at: 'css' put: 'text/css';
		 at: 'mpeg' put: 'video/mpeg';
		 at: 'mpg' put: 'video/mpeg';
		 at: 'mpe' put: 'video/mpeg';
		 at: 'qt' put: 'video/quicktime';
		 at: 'mov' put: 'video/quicktime';
		 at: 'avi' put: 'video/x-msvideo';
		 at: 'movie' put: 'video/x-sgi-movie'.
	^ d