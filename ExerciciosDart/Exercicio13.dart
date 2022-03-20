


void main() {
  

int atual = 0;
int anterior = 0;  
  
  
  for(int x = 0; x < 30; x++){
      for(int i = 1; i < x; i++){
    
    if(i == 1){
      atual = 1;
      anterior=0;
    }else{
      atual+=anterior;
      anterior = atual - anterior;
    }
    
   
  }
     print(atual);
  }

}

