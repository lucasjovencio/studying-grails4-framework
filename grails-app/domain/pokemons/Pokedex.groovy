package pokemons

class Pokedex {
    String name
    Integer hp
    Integer attack
    Integer defense
    Integer speed_attack
    Integer speed_defense
    Integer speed
    static hasMany = [types: Type ]
    static mapping = {
        table "pokedex" 
        version false
    }
    static constraints = {
    }
}
