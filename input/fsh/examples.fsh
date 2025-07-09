// Examples for FSH Modelling Course - Animal Registry

// Example: Simple basic animal
Instance: SimpleAnimalExample
InstanceOf: Animal
Title: "Simple Animal Example"
Description: "A minimal example with basic concepts"
* active = true
* gender = #female
* birthDate = "2023-06-01"

* extension[animal].extension[species].valueCodeableConcept = AnimalTypesCS#rabbit "Rabbit"
* extension[rescueDate].valueDate = "2023-08-15"


// Weight observation for simple animal
Instance: SimpleAnimalWeightObservation
InstanceOf: Observation
Title: "Simple Animal Weight"
Description: "Weight observation for the simple rabbit"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#29463-7 "Body weight"
* subject = Reference(SimpleAnimalExample)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 2.1 'kg' "kg"

// Example: Basic domestic dog
Instance: BuddyTheGoldenRetriever
InstanceOf: DomesticAnimal
Title: "Buddy - Golden Retriever"
Description: "A typical pet dog registration example"
* active = true
* gender = #male
* birthDate = "2020-03-15"
* name.text = "Buddy"

* extension[animal].extension[species].valueCodeableConcept = AnimalTypesCS#dog "Dog"
* extension[animal].extension[breed].valueCodeableConcept = AnimalBreedsCS#golden-retriever "Golden Retriever"
* extension[animal].extension[genderStatus].valueCodeableConcept = http://hl7.org/fhir/animal-genderstatus#neutered "Neutered"

* extension[neutered].valueBoolean = true

* contact[0].relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RESPRSN "responsible party"
* contact[0].name.text = "John Smith"
* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "555-123-4567"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "john.smith@email.com"

// Veterinarian
* generalPractitioner = Reference(DrVetSmith)

// Weight observation for Buddy
Instance: BuddyWeightObservation
InstanceOf: Observation
Title: "Buddy's Weight"
Description: "Current weight observation for Buddy"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#29463-7 "Body weight"
* subject = Reference(BuddyTheGoldenRetriever)
* effectiveDateTime = "2024-01-20"
* valueQuantity = 32 'kg' "kg"
* performer = Reference(DrVetSmith)

// Example: Rescued cat
Instance: WhiskersThePersian
InstanceOf: DomesticAnimal
Title: "Whiskers - Persian Cat"
Description: "A rescued Persian cat with medical history"
* active = true
* gender = #female
* birthDate = "2019-07-22"
* name.text = "Whiskers"

// Standard animal extension
* extension[animal].extension[species].valueCodeableConcept = AnimalTypesCS#cat "Cat"
* extension[animal].extension[breed].valueCodeableConcept = AnimalBreedsCS#persian "Persian"
* extension[animal].extension[genderStatus].valueCodeableConcept = http://hl7.org/fhir/animal-genderstatus#intact "Intact"

* extension[rescueDate].valueDate = "2023-01-10"
* extension[neutered].valueBoolean = false

// Use contact for shelter caregiver
* contact[0].name.text = "City Animal Shelter"
* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "555-SHELTER"
* contact[0].organization = Reference(AnimalShelter)

* generalPractitioner = Reference(DrVetJones)
* managingOrganization = Reference(AnimalShelter)

// Weight observation for Whiskers
Instance: WhiskersWeightObservation
InstanceOf: Observation
Title: "Whiskers' Weight"
Description: "Current weight observation for Whiskers"
* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#29463-7 "Body weight"
* subject = Reference(WhiskersThePersian)
* effectiveDateTime = "2024-01-15"
* valueQuantity = 4.2 'kg' "kg"
* performer = Reference(DrVetJones)

// Example: Wildlife animal
Instance: EagleInRehab
InstanceOf: WildlifeAnimal
Title: "Bald Eagle in Rehabilitation"
Description: "An endangered bald eagle in wildlife rehabilitation"
* active = true
* gender = #female
* birthDate = "2022-05-01"
* name.text = "Liberty"

// Standard animal extension
* extension[animal].extension[species].valueCodeableConcept = AnimalTypesCS#wildlife "Wildlife"

// Custom extensions
* extension[rescueDate].valueDate = "2023-08-15"
* modifierExtension[endangeredStatus].valueCodeableConcept = ConservationStatusCS#NT "Near Threatened"

* generalPractitioner = Reference(DrWildlifeVet)
* managingOrganization = Reference(WildlifeRehabCenter)

// Example: Veterinary patient
Instance: MaxInTreatment
InstanceOf: VeterinaryPatient
Title: "Max - Dog in Treatment"
Description: "A dog currently receiving veterinary treatment"
* active = true
* gender = #male
* birthDate = "2021-11-03"
* name.text = "Max"

// Standard animal extension
* extension[animal].extension[species].valueCodeableConcept = AnimalTypesCS#dog "Dog"
* extension[animal].extension[breed].valueCodeableConcept = AnimalBreedsCS#mixed-dog "Mixed Breed Dog"
* extension[animal].extension[genderStatus].valueCodeableConcept = http://hl7.org/fhir/animal-genderstatus#neutered "Neutered"

// Required for veterinary patient
* extension[neutered].valueBoolean = true

// Use contact for family caregiver
* contact[0].relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RESPRSN "responsible party"
* contact[0].name.text = "Johnson Family"
* contact[0].telecom[0].system = #phone
* contact[0].telecom[0].value = "555-987-6543"
* contact[0].telecom[1].system = #email
* contact[0].telecom[1].value = "johnson.family@email.com"
* contact[0].address.line = "123 Main Street"
* contact[0].address.city = "Anytown"
* contact[0].address.state = "ST"
* contact[0].address.postalCode = "12345"

* generalPractitioner = Reference(DrVetSmith)
