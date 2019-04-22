interface pencere{

  void draw();
 
 void setup();
  
 void mousePressed();
  void mousePressed(int x,int y);
 
 void keyPressed();
 void keyPressed(int tus);
}// sınıf sonu

class normalPencere implements pencere{
  
   pencereKontrolu pt; 
   alanKontrolcu al;
  
   void draw(){
     
   }
 
 void setup(){
   
 }
  
 void mousePressed(){
   
   al.mousePressed();
 }
 
 void keyPressed(){
  //  println("normal pencere kısmında başarılı bir çalışma");
    al.keyPressed();
}

 void keyPressed(int x){
  //  println("normal pencere kısmında başarılı bir çalışma");
    al.keyPressed(x);
}
 void mousePressed(int x, int y){
 al.mousePressed(x,y);
}// fonksiyon sonu

  
}// sınıf sonu
