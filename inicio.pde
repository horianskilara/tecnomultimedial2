void pantallaInicio() {
  background(inicio);
  mundo.step();
  pinza.actualizar( x, y, cierrePinza );
  pinza.dibujar();
  
}
