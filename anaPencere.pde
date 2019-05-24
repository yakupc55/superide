
class anaPencere extends normalPencere{

 anaPencere(pencereKontrolu gelenKontrol){
   pt=gelenKontrol;
  setup();
 }// constructor sonu
 
 
   void draw(){
    background(0);
    al.draw();
   }
 
 void setup() {
    yaziKutusu yaz1=new yaziKutusu(10,10,100,20);
    al.alanEkle(yaz1);
     yaziKutusu yaz2=new yaziKutusu(200,50,100,20);
    al.alanEkle(yaz2);
 }// fonksiyon sonu
 
  
}// sınıf sonu
