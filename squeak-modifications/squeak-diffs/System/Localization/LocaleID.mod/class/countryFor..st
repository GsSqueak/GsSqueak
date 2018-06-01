accessing
countryFor: iso6391Code
	"http://www.loc.gov/standards/iso639-2/php/code_list.php"
	^ iso6391Code
		caseOf:
			{ ['af'] -> ['Afrikaans'].
			['ca'] -> ['Catalan'].
			['cs'] -> [ 'Czech'].
			['da'] -> [ 'Danish'].
			['de'] -> [ 'German'].
			['el'] -> [ 'Greek Modern'].
			['en'] -> [ 'English'].
			['es'] -> [ 'Spanish'].
			['eu'] -> [ 'Basque'].
			['fi'] -> [ 'Finnish'].
			['fo'] -> [ 'Faroese'].
			['fr'] -> [ 'French'].
			['ga'] -> [ 'Irish'].
			['gd'] -> [ 'Gaelic'].
			['hr'] -> [ 'Croatian'].
			['hu'] -> [ 'Hungarian'].
			['is'] -> [ 'Icelandic'].
			['it'] -> [ 'Italian'].
			['ja'] -> [ 'Japanese'].
			['ja-etoys'] -> [ 'Japanese'].
			['ko'] -> [ 'Korean'].
			['nl'] -> [ 'Dutch'].
			['no'] -> [ 'Norwegian'].
			['pt'] -> [ 'Portuguese'].
			['rm'] -> [ 'Romansh'].
			['ro'] -> [ 'Romainian'].
			['sk'] -> [ 'Slovak'].
			['sl'] -> [ 'Slovenian'].
			['sq'] -> [ 'Albanian'].
			['sv'] -> [ 'Swedish'].
			['sw'] -> [ 'Swahili'].
			['zh'] -> [ 'Chinese'] }
		otherwise:
			[ 'other' ]