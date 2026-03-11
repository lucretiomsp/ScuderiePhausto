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

	| kawai |
	allSamplers := OrderedCollection new.
	kawai := (TpSampler new pathToFolder:
		          '/Users/domenicocipriani/MyStuff/samples/KawaiR50-Restoration/SpectrallyEnhanced')
		         label: 'kawai'.
	allSamplers add: kawai
]
