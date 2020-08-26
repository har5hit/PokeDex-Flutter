# Pokedex Flutter
A Demo Application for demonstrating MVVM design pattern using [Bloc](https://github.com/felangel/bloc), Speeding up development and Team velocity with Auto generation of boilerplate code using [Hygen](https://www.hygen.io/) code generator.

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

![Android CI](https://github.com/har5hit/PokeDex-Flutter/workflows/Android%20CI/badge.svg)

![Screenshot](https://github.com/har5hit/PokeDex-Flutter/blob/master/previews/screenshot.png?raw=true)


# Application Structure

* **/data** (All data related files)
  * /entity_1 (for e.g: Person)
    * /model 
    * /repository 
    * /network
    
* **/presentation** (All view related files)
  * /module_1
    * /component_1
      * /bloc
      * /screen
      * /widget
      

# Code Generation

### Prerequisite
* Install [Hygen](http://www.hygen.io/docs/quick-start)

### Generate View Components


```
hygen component new
```
![Screenshot](https://github.com/har5hit/PokeDex-Flutter/blob/master/previews/generate_component.png?raw=true)

```
hygen repository new
```
![Screenshot](https://github.com/har5hit/PokeDex-Flutter/blob/master/previews/generate_repository.png?raw=true)

# Github Actions (CI-CD) 

* [Android CI](https://github.com/har5hit/PokeDex-Flutter/blob/master/.github/workflows/android_ci.yml) - to verify every code push to/pull request on master branch is validated, error free and releases can be properly built.

![Workflow Complete](https://github.com/har5hit/PokeDex-Flutter/blob/master/previews/workflow_check.png?raw=true)

* [Android Artifact](https://github.com/har5hit/PokeDex-Flutter/blob/master/.github/workflows/android_artifact.yml) - Archives and hosts apk build on each tag push for sharing.

![Workflow Artifact](https://github.com/har5hit/PokeDex-Flutter/blob/master/previews/workflow_artifact.png?raw=true)

# TODO
- [ ] Unit Test Cases
- [ ] E2E Test Cases
- [ ] Persistence

# Resources

## Pokemon Data

<img src="https://user-images.githubusercontent.com/24237865/83422649-d1b1d980-a464-11ea-8c91-a24fdf89cd6b.png"/>

[PokeAPI](https://pokeapi.co/) - The RESTful Pokémon API

All the Pokémon data you'll ever need in one place,
easily accessible through a modern RESTful API.

## App Icon by ["Those Icons"](https://www.flaticon.com/authors/those-icons)

# License
```xml
Copyright 2020 Harshith Shetty (justadeveloper96@gmail.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
limitations under the License.
```
