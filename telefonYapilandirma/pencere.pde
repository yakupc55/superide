// her noktadan kontrol edilebilir bir alan kontrolcüsü ile çalışan bir pencere yapılandırması oluşturduk.
final alanKontrolcu al= new alanKontrolcu();
interface pencere{

  void draw();
 
 void setup();
  
 void mousePressed();
 void mousePressed(int x,int y);
void keyReleased(int x);
 void keyPressed();
 void keyPressed(int tus);
 void mouseMoved(int x,int y);
}// sınıf sonu

class normalPencere implements pencere{
  
   pencereKontrolu pt; 
  
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

void keyReleased(int x){
  
  
   al.keyReleased(x);
}

void mouseMoved(int x,int y){
   al.mouseMoved(x,y);
}
  
}// sınıf sonu
