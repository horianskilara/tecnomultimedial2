
void botonGeneral(int ubix, int ubiy, int tamx, int tamy, String pantallapasar) {
  noFill ();
  //fill(0);
  noStroke();
  rect(ubix, ubiy, tamx, tamy);
  if ((x > ubix) && (x < ubix + tamx) && (y > ubiy) && (y < ubiy + tamy)) {  // Cambio de parámetros
    println(pantallapasar);
    tiempoRestante = tiempoInicial;
    fondoMusica.loop();
    pantalla = pantallapasar;
    
  }
}

void botonPerder(int ubiX, int ubiY, int tamX, int tamY, String pantallapasar) {
  noFill ();
  noStroke();
  rect(ubiX, ubiY, tamX, tamY);
  perderSound.close();
  reiniciarSound.play();
  if ((x > ubiX) && (x < ubiX + tamX) && (y > ubiY) && (y < ubiY + tamY)) {  // Cambio de parámetros
    pantalla = pantallapasar;
}
}
