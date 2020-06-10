package pokemons

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class PokedexController {
    TypeService typeService
    PokedexService pokedexService
    PokedexTypesService pokedexTypesService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond pokedexService.list(params), model:[pokedexCount: pokedexService.count()]
    }

    def show(Long id) {
        respond pokedexService.get(id)
    }

    def create() {
        respond new Pokedex(params), model:[types:typeService.getTypes()]
    }

    def save(Pokedex pokedex) {
        if (pokedex == null) {
            notFound()
            return
        }

        try {
            pokedexService.save(pokedex)
            pokedexTypesService.save(pokedex,params.types);
        } catch (ValidationException e) {
            respond pokedex.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pokedex.label', default: 'Pokedex'), pokedex.id])
                redirect pokedex
            }
            '*' { respond pokedex, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond pokedexService.get(id), model:[types:typeService.getTypes()]
    }

    def update(Pokedex pokedex) {
        if (pokedex == null) {
            notFound()
            return
        }
        try {
            pokedexService.save(pokedex)
            pokedexTypesService.save(pokedex,params.types);
        } catch (ValidationException e) {
            respond pokedex.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'pokedex.label', default: 'Pokedex'), pokedex.id])
                redirect pokedex
            }
            '*'{ respond pokedex, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        pokedexService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'pokedex.label', default: 'Pokedex'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pokedex.label', default: 'Pokedex'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
