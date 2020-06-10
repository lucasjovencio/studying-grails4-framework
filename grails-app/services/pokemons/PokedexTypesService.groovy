package pokemons

import grails.gorm.transactions.Transactional

@Transactional
class PokedexTypesService {

    def serviceMethod() 
    {

    }

    def save(pokedex,types)
    {
        for(type in types){
            pokedex.addToTypes(type_id:type)
            pokedex.save(flush: true)
        }
    }
}
