package pokemons

import grails.gorm.transactions.Transactional

@Transactional
class PokedexService {

    def serviceMethod() 
    {

    }

    def list(params) 
    {
        Pokedex.list(params)
    }

    def get(id)
    {
        Pokedex.get(id)
    }

    def count() 
    {
        Pokedex.count()
    }

    def save(pokedex) {
        pokedex.save(flush: true)
    }

    def delete(id)
    {
        Pokedex poke = get(id)
        poke.delete()
    }
}
