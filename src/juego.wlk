import wollok.game.*
import player.*
import HUD.*
import espada.*
import slime.*
import plataformas.* 
import moneda.*
import teletransportadores.*
import puerta.*
import niveles.*
import playerHit.*

object juego {

	const property tamanho = 40
	const property objetos = []
	const property animables = []
	const property reInstanciables = []
	const property tickEvents = []
	const property visuals = []
	var property monedas = 0
	var property objetivoMonedas = 6
	var property dropCoin = []
	var property nivel = 0
	
	
	
	
	method configurar() {
		game.width(tamanho)
		game.height(tamanho)
		game.cellSize(12)
		game.title("platformero")

		keyboard.space().onPressDo{ player.saltar()}
		keyboard.right().onPressDo{ player.caminar(true)}
		keyboard.left().onPressDo{ player.caminar(false)}
		keyboard.r().onPressDo{ self.InstanciarNivel()}
		keyboard.q().onPressDo{ player.atacar1()}
		keyboard.w().onPressDo{ player.atacar2()}
		keyboard.e().onPressDo{ player.atacar3()}
	}

	method obtenerMoneda(){
		monedas += 1
		if (monedas == objetivoMonedas){
			puerta.abrirPuerta()
		}
	}
	
	method ganar(){
		player.quitarVida()
		puerta.cerrarPuerta()

		game.say(player, "Yo ya gané")
		nivel = 1
		self.InstanciarNivel()
		
	}
	
	method InstanciarNivel() {
		animables.forEach({ unObjeto => self.detener(unObjeto)})
		visuals.forEach({ unObjeto => game.removeVisual(unObjeto)})
		objetos.clear()
		visuals.clear()
		animables.clear()
		reInstanciables.clear()
		monedas = 0
		
		selectorNiveles.listaNiveles().get(nivel).cargar()
		self.iniciar()
		player_hit.cargar()
		
	}
	
	method iniciar() {
		animables.forEach({ unObjeto => unObjeto.iniciar()})
	}

	method colisiones() {
		player.hitbox().forEach({ x => game.onCollideDo(x, { obstaculo => obstaculo.chocar()})})
		game.onCollideDo(ataque, { obstaculo => obstaculo.serAtacado(ataque.danho())})
	}

	method terminar() {
		//game.addVisual(gameOver)
		animables.forEach({ unObjeto => self.detener(unObjeto)})
		reInstanciables.forEach({ unObjeto => unObjeto.reiniciar()})
		
	}
	
	method detener(objeto){
		if (visuals.contains(objeto)){
			objeto.detener()
		}
	}


}