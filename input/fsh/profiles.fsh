// Main Animal Profile based on Patient
Profile: Animal
Parent: Patient
Id: animal
Title: "Animal"
Description: "A profile representing an animal in the registry system"
* ^status = #active
* ^experimental = false

// Mix of standard and custom extensions
* extension contains
    http://hl7.org/fhir/StructureDefinition/patient-animal named animal 1..1 and
    RescueDate named rescueDate 0..1 and
    Neutered named neutered 0..1

// Configure the standard animal extension
* extension[animal].extension[species] 1..1
* extension[animal].extension[species].valueCodeableConcept from AnimalTypesVS (required)
* extension[animal].extension[breed] 0..1
* extension[animal].extension[breed].valueCodeableConcept from AnimalBreedsVS (preferred)
* extension[animal].extension[genderStatus] 0..1

// Constrain Patient fields for animals
* active 1..1
* active = true
* gender 1..1

// Configure contact for caregivers
* contact ^short = "Animal caregiver/owner contact information"
* contact ^definition = "Contact information for the animal's caregiver, owner, or responsible party"
* contact.relationship 1..*
* contact.relationship ^short = "Relationship to animal"
* contact.relationship ^definition = "The relationship of the contact to the animal (owner, caregiver, emergency contact, etc.)"

// Add constraints with explanations
* gender ^short = "Animal sex"
* gender ^definition = "The biological sex of the animal"
* birthDate ^short = "Animal birth date"
* birthDate ^definition = "The date of birth of the animal, if known"
* photo ^short = "Animal photos"
* photo ^definition = "Photographs of the animal for identification"
* generalPractitioner ^short = "Veterinarian"
* generalPractitioner ^definition = "Reference to the animal's veterinarian(s)"
* generalPractitioner only Reference(Practitioner)
* managingOrganization ^short = "Managing organization"
* managingOrganization ^definition = "The organization responsible for the animal (shelter, clinic, etc.)"

// Specialized profiles for different animal types
Profile: DomesticAnimal
Parent: Animal
Id: domestic-animal
Title: "Domestic Animal"
Description: "A profile for domestic animals (pets)"
* ^status = #active
* ^experimental = false

* extension[animal].extension[species].valueCodeableConcept from DomesticAnimalsVS (required)
* contact 1..*
* contact.relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RESPRSN "responsible party"
* extension[neutered] 1..1
* generalPractitioner 1..*

Profile: WildlifeAnimal
Parent: Animal
Id: wildlife-animal
Title: "Wildlife Animal"
Description: "A profile for wildlife animals in conservation or rehabilitation"
* ^status = #active
* ^experimental = false

* modifierExtension contains EndangeredStatus named endangeredStatus 0..1
* extension[animal].extension[species].valueCodeableConcept from AnimalTypesVS (required)
* extension[rescueDate] 1..1

* extension contains animal-characteristics named characteristics 0..1
* extension[characteristics].extension[microchipId] 1..1
* managingOrganization 1..1

// Profile for animals in veterinary care
Profile: VeterinaryPatient
Parent: Animal
Id: veterinary-patient
Title: "Veterinary Patient"
Description: "An animal currently receiving veterinary care"
* ^status = #active
* ^experimental = false

* generalPractitioner 1..1
* active = true

// Constraint examples with invariants
Profile: AnimalWithValidation
Parent: Animal
Id: animal-with-validation
Title: "Animal with Validation Rules"
Description: "Demonstrates custom validation rules for animals"
* ^status = #active
* ^experimental = false

* obeys animal-birth-date-valid

Invariant: animal-birth-date-valid
Description: "Animal birth date cannot be future"
Expression: "birthDate.empty() or birthDate <= today()"
Severity: #error
