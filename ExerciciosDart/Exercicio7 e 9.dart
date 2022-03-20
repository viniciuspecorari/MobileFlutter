


void main() {
  
  double peso = 68.200, altura = 1.75, result = 0;
  String genero = 'M'  ;
  
  result = peso / (altura * altura);
  
  if(genero == 'M'){
    if(result < 19){
      print("Abaixo do peso.");
    }else if(result <= 19 && result < 24){
      print("Peso ideal.");
    }else{
      print("Acima do peso.");
    }
  }else{
        if(result < 20){
      print("Abaixo do peso.");
    }else if(result <= 20 && result < 25){
      print("Peso ideal.");
    }else{
      print("Acima do peso.");
    }
  }
  
}
