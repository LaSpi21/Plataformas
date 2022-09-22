
import wollok.game.*
import juego.*
import player.*

class Obtenibles{
	
	var property position
	
	method image()
	
	method chocar(){
		game.removeVisual(self)
		juego.visuals().remove(self)
	}
	
	method serAtacado(x){}
	
	method esSuelo() = false
}

