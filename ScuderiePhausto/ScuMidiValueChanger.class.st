"
I am an utility object use to change Midi CCs.
"
Class {
	#name : 'ScuMidiValueChanger',
	#superclass : 'Object',
	#instVars : [
		'destinationValue',
		'startValue',
		'stepValue',
		'numberOfSteps',
		'interval',
		'ccNumber',
		'midiSender',
		'midiChannel'
	],
	#category : 'ScuderiePhausto',
	#package : 'ScuderiePhausto'
}

{ #category : 'accessing' }
ScuMidiValueChanger >> ccNumber: aMidiCC [


ccNumber := aMidiCC 
]

{ #category : 'accessing' }
ScuMidiValueChanger >> destinationValue: aMidiValue [ 

destinationValue := aMidiValue 
]

{ #category : 'accessing' }
ScuMidiValueChanger >> interval: aStepDelay [

interval := aStepDelay 
]

{ #category : 'accessing' }
ScuMidiValueChanger >> midiChannel: aMidichannel [


midiChannel := aMidichannel 
]

{ #category : 'accessing' }
ScuMidiValueChanger >> midiSender: aMidiSender [


midiSender := aMidiSender 
]

{ #category : 'accessing' }
ScuMidiValueChanger >> numberOfSteps: aNumberOfSteps [

numberOfSteps := aNumberOfSteps 
]

{ #category : 'accessing' }
ScuMidiValueChanger >> startValue: aMidiValue [ 

startValue := aMidiValue 
]

{ #category : 'accessing' }
ScuMidiValueChanger >> stepValue: aStepValue [

stepValue := aStepValue 
]
