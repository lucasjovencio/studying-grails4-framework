package pokemons

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PokedexServiceSpec extends Specification {

    PokedexService pokedexService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Pokedex(...).save(flush: true, failOnError: true)
        //new Pokedex(...).save(flush: true, failOnError: true)
        //Pokedex pokedex = new Pokedex(...).save(flush: true, failOnError: true)
        //new Pokedex(...).save(flush: true, failOnError: true)
        //new Pokedex(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //pokedex.id
    }

    void "test get"() {
        setupData()

        expect:
        pokedexService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Pokedex> pokedexList = pokedexService.list(max: 2, offset: 2)

        then:
        pokedexList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        pokedexService.count() == 5
    }

    void "test delete"() {
        Long pokedexId = setupData()

        expect:
        pokedexService.count() == 5

        when:
        pokedexService.delete(pokedexId)
        sessionFactory.currentSession.flush()

        then:
        pokedexService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Pokedex pokedex = new Pokedex()
        pokedexService.save(pokedex)

        then:
        pokedex.id != null
    }
}
