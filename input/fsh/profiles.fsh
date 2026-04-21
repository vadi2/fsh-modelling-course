// Main BasicAnimal Profile based on Patient
Profile: BasicAnimal
Parent: Patient
Id: basic-animal
Title: "Basic Animal"
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

* contact ^slicing.discriminator.type = #value
* contact ^slicing.discriminator.path = "relationship"
* contact ^slicing.rules = #open
* contact ^slicing.description = "Slice contact by relationship type"
* contact ^short = "Animal caregiver/owner contact information"
* contact ^definition = "Contact information for the animal's caregiver, owner, or responsible party"

// Define slices for different contact types
* contact contains
    owner 0..1 and
    emergencyContact 0..1

* contact[owner].relationship 1..1
* contact[owner].relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RESPRSN "responsible party"
* contact[owner].name 1..1
* contact[owner] ^short = "Animal owner"
* contact[owner] ^definition = "The legal owner of the animal"

* contact[emergencyContact].relationship 1..1
* contact[emergencyContact].relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#ECON "emergency contact"
* contact[emergencyContact].name 1..1
* contact[emergencyContact].telecom 1..*
* contact[emergencyContact] ^short = "Emergency contact"
* contact[emergencyContact] ^definition = "Person to contact in case of emergency"

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
Parent: BasicAnimal
Id: domestic-animal
Title: "Domestic Animal"
Description: "A profile for domestic animals (pets)"
* ^status = #active
* ^experimental = false

* extension[animal].extension[species].valueCodeableConcept from DomesticAnimalsVS (required)
* extension[neutered] 1..1
* generalPractitioner 1..*

Profile: WildlifeAnimal
Parent: BasicAnimal
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
Parent: BasicAnimal
Id: veterinary-patient
Title: "Veterinary Patient"
Description: "An animal currently receiving veterinary care"
* ^status = #active
* ^experimental = false

* generalPractitioner 1..1
* active = true

// Constraint examples with invariants
Profile: AnimalWithValidation
Parent: BasicAnimal
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
