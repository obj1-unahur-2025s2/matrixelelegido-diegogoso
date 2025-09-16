/*De la nave nos interesa averiguar: 
* Cuántos pasajeros hay
* El pasajero de mayor vitalidad
* Si está equilibrada en vitalidad, lo que sucede cuando ninguno
 de los pasajeros tiene más que el doble de vitalidad que cualquier
  otro pasajero.
* Si el elegido está en la nave 

Y también hay hechos que le suceden a la nave
* Cuando la nave choca, todos sus pasajeros saltan para salvarse
 y se van de la nave. 
* Cuando la nave acelera, todos sus pasajeros, excepto el
 elegido, saltan de alegría y permanecen en la nave.	

*/
import pasajeros.*
object nave{
    const pasajeros = []
    
    method agregarPasajero(unPasajero) = pasajeros.add(unPasajero)
    
    method cantidadDePasajeros() = pasajeros.size()
    
    method pasajeroDeMayorVitalidad() = pasajeros.max({p -> p.vitalidad()})
    
    method estaEquilibradaEnVitalidad() = 
        pasajeros.all(p1 -> pasajeros.all({p2 -> p1.vitalidad() <= 2 * p2.vitalidad()}))
    
    method estaElElegido() = pasajeros.any({p -> p.esElElegido()})
    
    method chocar(){
        pasajeros.each({p -> p.saltar()})
        pasajeros.clear()
    }
    
    method acelerar(){
        pasajeros.each({p -> if (not p.esElElegido()) p.saltar()})
        pasajeros.removeIf({p -> not p.esElElegido() and p.vitalidad() == 0})
    }
}