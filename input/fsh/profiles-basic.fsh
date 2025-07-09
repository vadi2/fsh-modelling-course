// Simple profile demonstrating basic constraints
Profile: BasicAnimal
Parent: Patient
Id: basic-animal
Title: "Basic Animal (Teaching Example)"
Description: "A simplified animal profile for teaching basic FSH concepts"
* ^status = #active
* ^experimental = false

// Required standard extension
// * extension contains http://hl7.org/fhir/StructureDefinition/patient-animal named animal 1..1

// or this:
* extension contains patient-animal named animal 1..1

// Configure the standard animal extension
* extension[animal].extension[species].valueCodeableConcept from AnimalTypesVS (required)

// Cardinality constraints
* active 1..1
* gender 1..1

// Fixed values
* active = true

// Datatype constraints
* photo 0..3

// Reference constraints
* generalPractitioner only Reference(Practitioner)

// Must Support flags
* gender MS
* birthDate MS
* photo MS

// Short descriptions for teaching
* gender ^short = "Animal's biological sex"
* birthDate ^short = "When the animal was born"
* photo ^short = "Pictures of the animal"
