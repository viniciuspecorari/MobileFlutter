void main() {

var numeros = [10];

  numeros = [1,2,3,4,5,6,7,8,9,10];
  
  print("Ordem crescente: $numeros");
  
  print("Ordem Decrescente:");
  for(int x = 9; x >= 0; x--){
    print(">> ${numeros[x]}");
  }
}


