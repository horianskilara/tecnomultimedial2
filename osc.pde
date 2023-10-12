void oscEvent(OscMessage msg) {
  String address = msg.addrPattern();
  if (address.equals("/landmarks")) {
    float[] landmarks = new float[63];
    for (int i = 0; i < landmarks.length; i++) {
      landmarks[i] = msg.get(i).floatValue();
    }

    // Obtener las coordenadas de los puntos clave relevantes
    float[] dedoPulgar = { landmarks[0], landmarks[1], landmarks[2] };
    float[] dedoIndice = { landmarks[3], landmarks[4], landmarks[5] };
    float[] dedoMedio = { landmarks[6], landmarks[7], landmarks[8] };
    float[] dedoAnular = { landmarks[9], landmarks[10], landmarks[11] };
    float[] dedoMenique = { landmarks[12], landmarks[13], landmarks[14] };

    // Calcular la distancia entre los puntos clave del dedo índice y el dedo pulgar
    float distanciaDedos = dist(dedoMenique[0], dedoMenique[2], dedoPulgar[0], dedoPulgar[2]);

    // Determinar si la mano está cerrada o abierta basándose en la distancia
    if (distanciaDedos > 70) {
      manoCerrada = false;
      manoAbierta = true;
    } else {
      manoCerrada = true;
      manoAbierta = false;
    }

    // Actualizar las coordenadas x e y según los datos de landmarks
    x = landmarks[0]; // Por ejemplo, usa la coordenada x del punto clave del pulgar
    y = landmarks[1]; // Por ejemplo, usa la coordenada y del punto clave del pulgar
  }
}
