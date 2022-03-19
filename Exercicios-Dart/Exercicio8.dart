


void main() {
  
  double a = 5, b = 10, c = 9;
  bool triangulo;
  
  
if(b - c < a && b - c < b + c){
  if(a - c < b &&  a - c < a + c){
    if(a - b < c  && a - b < a + b){
      triangulo = true;
    }else{
      triangulo = false;
    } 
  }else{
      triangulo = false;
    } 
}else{
      triangulo = false;
    }   
    
  print("É um trinÂngulo: $triangulo");
  
  
}
