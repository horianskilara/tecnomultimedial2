class Pinza{
  PImage garraCerrada,garraAbierta;
  float x,y;
  
  boolean antesCerrada; 
  
  float tolerancia  = 50;
  
  FMouseJoint manija = null;
     
  Pinza(){
  }
  
  void actualizar( float x_ , float y_ , boolean cerrada_ ){
    garraCerrada = loadImage("garra_cerrada.png");
    garraAbierta = loadImage("garra_abierta.png");
    x = x_;
    y = y_;
    cerrada = cerrada_;
    seCerro = cerrada && !antesCerrada;
    seAbrio = !cerrada && antesCerrada;
    antesCerrada = cerrada;
    if( manija!=null ){
      println("estoPasa");
      manija.setTarget(x,y);
    }
  }
  
  void revisarPeluches( ArrayList <FBox> misPeluches , FWorld mundo ){
    
    if( seCerro ){
      if( manija == null ){
        
        for( FBox este: misPeluches ){
          if( dist( este.getX() , este.getY() , x , y ) < tolerancia ){
            manija = new FMouseJoint( este , x , y );
            mundo.add( manija );
            break;
          }
        }
        
      }
    }
    
    if( seAbrio ){
      if( manija != null ){
        mundo.remove( manija );
        manija = null;
      }
    }
    
  }
  
 
  
  
  void dibujar(){
    push();
    if( cerrada ){
      image(garraCerrada,x-25,y-360);
      noFill();
      noStroke();
    }else{
      image(garraAbierta,x-25,y-360);
      noFill();
      noStroke();
    }
    ellipse( x , y , 50 , 50 );
    pop();
  }
  
  
}
