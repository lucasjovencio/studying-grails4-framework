package pokemons

import grails.gorm.transactions.Transactional

@Transactional
class TypeService {

    def serviceMethod() {

    }

    def getTypes() {
        Type.list()
    }


    def list(params) 
    {
        Type.list(params)
    }

    def get(id)
    {
        Type.get(id)
    }

    def count() 
    {
        Type.count()
    }

    def save(type) {
        type.save(flush: true)
    }

    def delete(id)
    {
        Type type = get(id)
        type.delete()
    }
}
