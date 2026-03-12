"
TurboPhausto subclass fot Algorave at Tivoli Utrecht, April 24th 2026.
The name VanPhausten is a tribute to the legendary Marco Van Baste, ""il cigno di Utrecht""
"
Class {
	#name : 'VanPhausten',
	#superclass : 'TurboPhausto',
	#category : 'ScuderiePhausto',
	#package : 'ScuderiePhausto'
}

{ #category : 'loading' }
VanPhausten class >> loadAllSamplers [

	| kawai kick tsFolder oh clap snare clave ch bleep blip ride rim bongo conga loop|
	tsFolder := self turboSamplesFolder.
	allSamplers := OrderedCollection new.
	kawai := (TpSampler new pathToFolder:
		          '/Users/domenicocipriani/MyStuff/samples/KawaiR50-Restoration/SpectrallyEnhanced')
		         label: 'kawai'.
	kick := (TpSampler new pathToFolder: tsFolder , '/kick') label:
		        'kick'.
	clap := (TpSampler new pathToFolder: tsFolder , '/clap') label:
		        'clap'.
	snare := (TpSampler new pathToFolder: tsFolder , '/snare') label:
		         'snare'.
	clave := (TpSampler new pathToFolder: tsFolder , '/clave') label:
		         'clave'.
	ch := (TpSampler new pathToFolder: tsFolder , '/ch') label: 'ch'.
	oh := (TpSampler new pathToFolder: tsFolder , '/oh') label: 'oh'.
	bleep := (TpSampler new pathToFolder: tsFolder , '/bleep') label:
		         'bleep'.
	blip := (TpSampler new pathToFolder: tsFolder , '/blip') label:
		        'blip'.
	ride := (TpSampler new pathToFolder: tsFolder , '/ride') label:
		        'ride'.
	rim := (TpSampler new pathToFolder: tsFolder , '/rim') label: 'rim'.
	bongo := (TpSampler new pathToFolder: tsFolder , '/bongo') label:
		         'bongo'.
	conga := (TpSampler new pathToFolder: tsFolder , '/conga') label:
		         'conga'.
	loop := (TpSampler new pathToFile: '/Users/domenicocipriani/MyStuff/samples/utrechtLoops/DrumLoop_GsObject_140.wav' ) label: 'loop'.
	allSamplers
		add: kawai;
		add: kick;
		add: ch;
		add: clap;
		add: snare;
		add: clave;
		add: ch;
		add: oh;
		add: bleep;
		add: blip;
		add: ride;
		add: rim;
		add: bongo;
		add: conga;
		add: loop.
]
