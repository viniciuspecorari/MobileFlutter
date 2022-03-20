


void main() {
  

  int VelocidadeFinal = 0;
  int VelocidadeInicial = 0;
  int Aceleracao  = 0;
  int Tempo  = 0;  
  
  VelocidadeFinal = VelocidadeInicial + (Aceleracao * Tempo);
  
  if(VelocidadeFinal <= 40){
    print("Veículo muito lento");
  }else if(VelocidadeFinal < 40 && VelocidadeFinal <= 60){
    print("Vecolidade permitida");
  }else if(VelocidadeFinal < 60 && VelocidadeFinal <= 80){
    print("Vecolidade de cruzeiro");
  }else if(VelocidadeFinal < 80 && VelocidadeFinal <= 120){
    print("Veículo rápido");
  }else{
    print("Veículo muito rápido");
  }
    
}

