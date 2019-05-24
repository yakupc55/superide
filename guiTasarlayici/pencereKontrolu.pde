 class pencereKontrolu{
   int z=9;
pencere aktifPencere;
  pencereKontrolu(){
  
 
aktifPencere=new anaPencere(this);
  }
  
  void draw(){
  aktifPencere.draw();
  }
  
  void keyPressed(){
//     println("pencere kontrol kısmında başarılı bir çalışma");
  aktifPencere.keyPressed();
  }// fonksiyon sonu
  
  void keyPressed(int x){
//     println("pencere kontrol kısmında başarılı bir çalışma");
  aktifPencere.keyPressed(x);
  }// fonksiyon sonu  
  
  void keyReleased(int x){
//     println("pencere kontrol kısmında başarılı bir çalışma");
  aktifPencere.keyReleased(x);
  }// fonksiyon sonu  
  
  void mousePressed(){
 aktifPencere.mousePressed();
}// fonksiyon sonu

 void mousePressed(int x, int y){
 aktifPencere.mousePressed(x,y);
}// fonksiyon sonu

void mouseMoved(int x, int y){
 aktifPencere.mouseMoved(x,y);
}// fonksiyon sonu

void mouseReleased(int x, int y){
 aktifPencere.mouseReleased(x,y);
}// fonksiyon sonu

void mouseDragged(int x, int y){
 aktifPencere.mouseDragged(x,y);
}// fonksiyon sonu

}//sınıf sonu
