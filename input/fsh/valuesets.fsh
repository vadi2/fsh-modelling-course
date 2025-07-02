// ValueSets for FSH Modelling Course - Animal Registry

// Method 1: Simple inclusion of entire CodeSystem
ValueSet: AnimalTypesVS
Id: animal-types-vs
Title: "Animal Types"
Description: "All animal types available in the registry"
* ^status = #active
* ^experimental = false
* include codes from system $AnimalTypesCS

// Method 2: Selective inclusion with specific codes
ValueSet: DomesticAnimalsVS
Id: domestic-animals-vs
Title: "Domestic Animals"
Description: "Common domestic animals suitable for household pets"
* ^status = #active
* ^experimental = false
* include $AnimalTypesCS#dog
* include $AnimalTypesCS#cat
* include $AnimalTypesCS#bird
* include $AnimalTypesCS#rabbit
* include $AnimalTypesCS#hamster
* include $AnimalTypesCS#fish

// Method 3: Exclusion pattern - include all except specific codes
ValueSet: NonWildlifeAnimalsVS
Id: non-wildlife-animals-vs
Title: "Non-Wildlife Animals"
Description: "All animal types except wildlife"
* ^status = #active
* ^experimental = false
* include codes from system $AnimalTypesCS
* exclude $AnimalTypesCS#wildlife

// Method 4: Dog breeds only - filtered inclusion
ValueSet: DogBreedsVS
Id: dog-breeds-vs
Title: "Dog Breeds"
Description: "Available dog breeds in the registry"
* ^status = #active
* ^experimental = false
* include $AnimalBreedsCS#golden-retriever
* include $AnimalBreedsCS#labrador
* include $AnimalBreedsCS#german-shepherd
* include $AnimalBreedsCS#bulldog
* include $AnimalBreedsCS#poodle
* include $AnimalBreedsCS#mixed-dog

// Method 5: Cat breeds only
ValueSet: CatBreedsVS
Id: cat-breeds-vs
Title: "Cat Breeds"
Description: "Available cat breeds in the registry"
* ^status = #active
* ^experimental = false
* include $AnimalBreedsCS#persian
* include $AnimalBreedsCS#siamese
* include $AnimalBreedsCS#maine-coon
* include $AnimalBreedsCS#british-shorthair
* include $AnimalBreedsCS#mixed-cat

// Method 6: All breeds - entire CodeSystem inclusion
ValueSet: AnimalBreedsVS
Id: animal-breeds-vs
Title: "All Animal Breeds"
Description: "Complete list of all animal breeds in the registry"
* ^status = #active
* ^experimental = false
* include codes from system $AnimalBreedsCS

// Method 7: Conservation status with grouping
ValueSet: ThreatenedSpeciesVS
Id: threatened-species-vs
Title: "Threatened Species"
Description: "Conservation statuses indicating species are at risk"
* ^status = #active
* ^experimental = false
* include $ConservationStatusCS#NT "Near Threatened"
* include $ConservationStatusCS#VU "Vulnerable"
* include $ConservationStatusCS#EN "Endangered"
* include $ConservationStatusCS#CR "Critically Endangered"

// Method 8: Complete conservation status
ValueSet: ConservationStatusVS
Id: conservation-status-vs
Title: "Conservation Status"
Description: "All IUCN conservation status categories"
* ^status = #active
* ^experimental = false
* include codes from system $ConservationStatusCS

// Method 9: Mixed inclusion with external codes
ValueSet: AnimalIdentificationVS
Id: animal-identification-vs
Title: "Animal Identification Methods"
Description: "Methods for identifying animals, combining local and external codes"
* ^status = #active
* ^experimental = false
// Local concepts
* include $AnimalTypesCS#dog "Dog identification"
* include $AnimalTypesCS#cat "Cat identification"
// External SNOMED codes (examples)
* include $sct#397745006 "Medical identification tag"
* include $sct#261665006 "Unknown identification"

// Method 10: Compose from multiple systems
ValueSet: AnimalRegistryConceptsVS
Id: animal-registry-concepts-vs
Title: "Animal Registry Core Concepts"
Description: "Key concepts used throughout the animal registry system"
* ^status = #active
* ^experimental = false
* ^compose.include[0].system = $AnimalTypesCS
* ^compose.include[0].concept[0].code = #dog
* ^compose.include[0].concept[1].code = #cat
* ^compose.include[1].system = $ConservationStatusCS
* ^compose.include[1].concept[0].code = #EN
* ^compose.include[1].concept[1].code = #CR
