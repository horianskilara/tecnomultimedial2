void pantallaPerder() {
  pantalla = "perder";
  background(pantallaperder);
  pinza.actualizar( x, y, cierrePinza );
  pinza.dibujar();
  tiempoInicial = 60;
  perderSound.play();
  fondoMusica.pause();
  relojSound.pause();
}

void reiniciarJuego() {
  tiempoRestante = tiempoInicial; // Reinicia el temporizador.
  jugar = false; // Asegúrate de que el juego esté en pausa.
  pantalla = "juego"; // Cambia la pantalla a "juego".
  
  // Detener y volver a iniciar la música de fondo
  fondoMusica.close();
  fondoMusica = minim.loadFile("Juego.mp3");
  fondoMusica.loop();
  fondoMusica.setGain(0.5);
  
  // Eliminar todos los peluches existentes
 // mundo.remove(peluche_1);
  //mundo.remove(peluche_2);
  //mundo.remove(peluche_3);
  //mundo.remove(peluche_4);
  //mundo.remove(peluche_5);
  
  // Restaurar la cantidad de peluches
  //peluche_1 = creacionPeluche1(); // Vuelve a crear los objetos peluche o realiza cualquier otra inicialización necesaria.
  //peluche_2 = creacionPeluche2();
  //peluche_3 = creacionPeluche3();
  //peluche_4 = creacionPeluche4();
  //peluche_5 = creacionPeluche5();
}
