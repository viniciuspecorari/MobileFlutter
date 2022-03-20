void main() {
  

int atual = 1;
int anterior1 = 0; 

  
  
  
  for(int x = 0; x < 20; x++){
      for(int i = 1; i < x; i++){
    
    if(i == 1){
      atual = 1;
      anterior1=0;
    }else{
      atual+=anterior1+1;
      anterior1 = atual - 2;
    }
    
   
  }
     print(atual);
  }

}
