void pantallaInstrucciones1() {
  background(instrucciones1Img);
  mundo.step();
  pinza.actualizar( x, y, cierrePinza );
  pinza.dibujar();
}

void pantallaInstrucciones2() {
  background(instrucciones2Img);
  mundo.step();
  pinza.actualizar( x, y, cierrePinza );
  pinza.dibujar();
}

void pantallamovie(){
  movie.play();
  //tint(255, 20);
  image(movie, 0, 0, width, height);
  }
void movieEvent(Movie m) {
  m.read();
}
