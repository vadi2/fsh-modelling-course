// CodeSystems for FSH Modelling Course - Animal Registry

CodeSystem: AnimalTypes
Id: animal-types
Title: "Animal Types"
Description: "A code system defining different types of animals in the registry"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true

* #dog "Dog" "Domestic dog (Canis lupus familiaris)"
* #cat "Cat" "Domestic cat (Felis catus)"
* #bird "Bird" "Various bird species kept as pets or in care"
* #rabbit "Rabbit" "Domestic rabbit (Oryctolagus cuniculus)"
* #hamster "Hamster" "Small rodent commonly kept as pet"
* #fish "Fish" "Various aquatic species"
* #reptile "Reptile" "Reptilian species including snakes, lizards, turtles"
* #wildlife "Wildlife" "Wild animals in rehabilitation or conservation programs"

CodeSystem: AnimalBreeds
Id: animal-breeds
Title: "Animal Breeds"
Description: "A code system defining different breeds of animals"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true

// Dog breeds
* #golden-retriever "Golden Retriever" "Golden Retriever dog breed"
* #labrador "Labrador" "Labrador Retriever dog breed"
* #german-shepherd "German Shepherd" "German Shepherd dog breed"
* #bulldog "Bulldog" "English Bulldog breed"
* #poodle "Poodle" "Poodle dog breed"
* #mixed-dog "Mixed Breed Dog" "Mixed breed or crossbred dog"

// Cat breeds
* #persian "Persian" "Persian cat breed"
* #siamese "Siamese" "Siamese cat breed"
* #maine-coon "Maine Coon" "Maine Coon cat breed"
* #british-shorthair "British Shorthair" "British Shorthair cat breed"
* #mixed-cat "Mixed Breed Cat" "Mixed breed or crossbred cat"

// Bird types
* #parrot "Parrot" "Various parrot species"
* #canary "Canary" "Canary bird"
* #cockatiel "Cockatiel" "Cockatiel bird"

// Other
* #unknown-breed "Unknown Breed" "Breed is unknown or not specified"

CodeSystem: ConservationStatus
Id: conservation-status
Title: "Conservation Status"
Description: "Conservation status categories based on IUCN Red List classifications"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true

* #LC "Least Concern" "Species is widespread and abundant"
* #NT "Near Threatened" "Species is close to qualifying for threatened category"
* #VU "Vulnerable" "Species is facing high risk of extinction in wild"
* #EN "Endangered" "Species is facing very high risk of extinction in wild"
* #CR "Critically Endangered" "Species is facing extremely high risk of extinction in wild"
* #EW "Extinct in the Wild" "Species survives only in captivity"
* #EX "Extinct" "No known individuals remaining"
* #DD "Data Deficient" "Inadequate information to make assessment"
* #NE "Not Evaluated" "Species has not been evaluated against criteria"
