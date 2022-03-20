void main() {

var numeros = [10];
int maior=0;
numeros = [22,18,3,12,1,8,67,4,10,100];
  
  print("Valores: $numeros");
  
  for(int x = 9; x >= 0; x--){
    
    if(maior < numeros[x]){
      maior = numeros[x];
    }
    
  }
  
  print("Maior número >> $maior}");
}


