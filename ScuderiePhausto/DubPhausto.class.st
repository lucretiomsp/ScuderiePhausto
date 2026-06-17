"
Dub version for London Algorest on June 24th 2026
"
Class {
	#name : 'DubPhausto',
	#superclass : 'TurboPhausto',
	#category : 'ScuderiePhausto-TurboPhausto',
	#package : 'ScuderiePhausto',
	#tag : 'TurboPhausto'
}

{ #category : 'loading' }
DubPhausto class >> loadAllSamplers [

	| pad skank siren samplesFolder |
	super loadAllSamplers.
	samplesFolder := '/Users/domenicocipriani/MyStuff/samples/'.
	allSamplers := allSamplers asOrderedCollection.
	pad := (TpSampler new pathToFolder:
		        '/Users/domenicocipriani/MyStuff/samples/utrechtPads')
		       label: 'pad'.
	skank := (TpSampler new pathToFolder:
		         samplesFolder  ,  'algorest/skank')
		        label: #skank.
		siren := (TpSampler new pathToFolder:
		         samplesFolder  ,  'algorest/sirens')
		        label: #siren .


	allSamplers add: pad.
	allSamplers add: skank.
	allSamplers add: siren.
	
]
