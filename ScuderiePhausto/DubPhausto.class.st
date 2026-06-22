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

	| pad skank siren samplesFolder dwSirenMix dwSkankMix vox |
	super loadAllSamplers.
	samplesFolder := '/Users/domenicocipriani/MyStuff/samples/'.
	allSamplers := allSamplers asOrderedCollection.
	pad := (TpSampler new pathToFolder:
		        '/Users/domenicocipriani/MyStuff/samples/utrechtPads')
		       label: 'pad'.
	dwSkankMix := DryWetMonoMixer new fx: (PhEcho new
			               duration: #sirenTime;
			               feedBack: #sirenFb).
	skank := ((TpSampler new pathToFolder:
		          samplesFolder , 'algorest/skank') label: #skank) => dwSkankMix.
	dwSirenMix := DryWetMonoMixer new fx: (PhEcho new
			               duration: #sirenTime;
			               feedBack: #sirenFb).
	siren := ((TpSampler new pathToFolder:
		           samplesFolder , 'algorest/sirens') label: #siren)
	         => dwSirenMix.
	vox := (TpSampler new pathToFolder:
		        samplesFolder , 'algorest/vox')
		       label: 'pad'.


	allSamplers add: pad.
	allSamplers add: skank.
	allSamplers add: siren.
	allSamplers add: vox.
]

{ #category : 'initialization' }
DubPhausto >> initialize [

	super initialize.
	self bpm: 122.
	self initializeIndexes.
]

{ #category : 'initialization' }
DubPhausto >> initializeIndexes [

	self tpDsp setValue: 6 parameter: 'clapIndex'.
	self tpDsp setValue: 9 parameter: 'chIndex'
]
