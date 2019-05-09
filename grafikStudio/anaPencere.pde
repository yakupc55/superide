class anaPencere extends normalPencere{

 anaPencere(pencereKontrolu gelenKontrol){
   pt=gelenKontrol;
  setup();
 }// constructor sonu
 
 
   void draw(){
    background(128);
    al.draw();
   }
 
 void setup() {
   // kontrolcümüzü öncelikli olarak tanımlıyoruz
    al = new alanKontrolcu();
   // ondan sonra gerekli ekipmanları eklemeye başlıyoruz. 
    final yaziAlani yazi1=new yaziAlani(700,300,100,200);
    yazi1.yazi="bu bir yazı ama uzunluğu kesinlikle bilinmez bir yazı ne kadar daha uzun olacak onu tabiki sonrasında göreceğiz ";
   // yazi1.ozellikDurumu("genisYazi",true);
    al.alanEkle(yazi1);
    final yaziKutusu yaz1=new yaziKutusu(10,600,140,20);
    al.alanEkle(yaz1);
    final yaziKutusu yaz2=new yaziKutusu(200,600,200,20);
    al.alanEkle(yaz2);
    final buton buton1=new buton(500,600,200,20);
    buton1.calismaTiklama = new Runnable(){
    
  public void run(){
    // burası fonksiyon kısmı bakalım ne olacak ne olmayacak.
    println("sistem başarılı bir çalışma işleminden geçmiş bulunmaktadır.");
  }};
    al.alanEkle(buton1);
    
 }// fonksiyon sonu
 
  
}// sınıf sonu
