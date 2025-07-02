// Supporting Examples - People and Organizations

// Pet owner
Instance: JohnSmithOwner
InstanceOf: RelatedPerson
Title: "John Smith - Pet Owner"
Description: "Pet owner for Buddy"
* active = true
* patient = Reference(BuddyTheGoldenRetriever)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RESPRSN "responsible party"
* name.family = "Smith"
* name.given = "John"
* telecom[0].system = #phone
* telecom[0].value = "555-123-4567"
* telecom[1].system = #email
* telecom[1].value = "john.smith@email.com"

// Family caregiver
Instance: FamilyCaregiver
InstanceOf: RelatedPerson
Title: "Family Caregiver"
Description: "Family member caring for Max"
* active = true
* patient = Reference(MaxInTreatment)
* relationship = http://terminology.hl7.org/CodeSystem/v3-RoleCode#RESPRSN "responsible party"
* name.family = "Johnson"
* name.given = "Sarah"

// Veterinarians
Instance: DrVetSmith
InstanceOf: Practitioner
Title: "Dr. Smith - Veterinarian"
Description: "Small animal veterinarian"
* active = true
* name.family = "Smith"
* name.given = "Emily"
* name.prefix = "Dr."
* qualification.code = $sct#106290006 "Veterinarian"

Instance: DrVetJones
InstanceOf: Practitioner
Title: "Dr. Jones - Veterinarian"
Description: "Veterinarian specializing in cats"
* active = true
* name.family = "Jones"
* name.given = "Michael"
* name.prefix = "Dr."
* qualification.code = $sct#106290006 "Veterinarian"

Instance: DrWildlifeVet
InstanceOf: Practitioner
Title: "Dr. Wildlife - Rehabilitation Veterinarian"
Description: "Veterinarian specializing in wildlife rehabilitation"
* active = true
* name.family = "Wildlife"
* name.given = "Jane"
* name.prefix = "Dr."
* qualification.code = $sct#106290006 "Veterinarian"

// Organizations
Instance: AnimalShelter
InstanceOf: Organization
Title: "City Animal Shelter"
Description: "Local animal shelter and rescue organization"
* active = true
* name = "City Animal Shelter"
* type = http://terminology.hl7.org/CodeSystem/organization-type#other "Other"
* contact
  * address.line = "123 Rescue Lane"
  * address.city = "Anytown"
  * address.state = "ST"
  * address.postalCode = "12345"

Instance: WildlifeRehabCenter
InstanceOf: Organization
Title: "Wildlife Rehabilitation Center"
Description: "Specialized wildlife rehabilitation facility"
* active = true
* name = "Regional Wildlife Rehabilitation Center"
* type = http://terminology.hl7.org/CodeSystem/organization-type#other "Other"
* contact
  * address.line = "456 Nature Trail"
  * address.city = "Forest City"
  * address.state = "ST"
  * address.postalCode = "54321"
