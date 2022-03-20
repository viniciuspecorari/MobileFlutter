void main() {
  

int atual = 5;
int anterior1 = 2; 

  print(anterior1);
  print(atual);
  
  for(int x = 0; x < 20; x++){

    
    if(x == 0){
      atual+=anterior1+3;
      anterior1 = atual - 6;
      
    }else{
      atual+=anterior1+3;
      anterior1 = atual - 11;
      
    }
      print(atual);
    
  }

}