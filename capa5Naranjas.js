class Capa5 {
  constructor() {
    // Arreglo de imágenes
    this.imagenes = [];

    // Cargar las imágenes en el arreglo
    for (let i = 0; i < 8; i++) {
      let img = loadImage('data/capa5Naranjas/capa5Naranjas' + nf(i, 2) + '.png');
      this.imagenes.push(img);
    }

    // Variable para almacenar la imagen actual
    this.imagenActual = random(this.imagenes);

    // Variables de rotación
    this.angle = 0;
   this.rotationSpeed = 0.03;
   this.minRotationSpeed = 0.1;
    this.maxRotationSpeed = 0.3;
  }

  dibujar() {
    // Obtener el centro del lienzo
    let centerX = width / 2;
    let centerY = height / 2;

    // Establecer el punto de origen de la rotación en el centro de la imagen
    translate(centerX, centerY);

    // Aplicar rotación al lienzo
   rotate(this.angle);

    // Dibujar la imagen actual en el lienzo
    image(this.imagenActual, -this.imagenActual.width / 2, -this.imagenActual.height / 2);

       // Restaurar la matriz de transformación
       resetMatrix();
      }
      
      rotar() {
        // Actualizar el ángulo de rotación
        //this.angle += this.rotationSpeed;
// Calcular la dirección de rotación en función de la posición del mouse
let rotationDirection=0;
// Calcular la dirección de rotación en función de la posición del mouse
if (frecuencia>=FREC_MAX/2 ){
   rotationDirection = 2;
} 
if (frecuencia<=FREC_MAX/2 && frecuencia>=FREC_MIN){
  rotationDirection = -2;
}
if (frecuencia=frecuenciaAnterior){
  rotationDirection
}

// Calcular la velocidad de rotación en función de la posición del mouse
let mouseYRatio = amp;
let currentRotationSpeed = map(mouseYRatio, AMP_MIN, AMP_MAX, this.minRotationSpeed, this.maxRotationSpeed);
let rotationSpeedAdjusted = this.rotationSpeed * currentRotationSpeed;

// Actualizar el ángulo de rotación
this.angle += rotationSpeedAdjusted * rotationDirection;


      }
    }