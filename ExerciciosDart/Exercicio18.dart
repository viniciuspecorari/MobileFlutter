void main() {

var numeros = [10];
int multiplicador =2;
numeros = [22,18,3,12,1,8,67,4,10,100];
  
  print("Array>> $numeros");
  
  for(int x = 9; x >= 0; x--){
    
    numeros[x] = numeros[x] * multiplicador;
    
  }
  
  print("Array multiplicado >> $numeros}");
}


