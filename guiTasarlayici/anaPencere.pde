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
   
   // ondan sonra gerekli ekipmanları eklemeye başlıyoruz. 
    final yaziAlani yazi1=new yaziAlani(300,300,100,200);
    yazi1.yazi="bu bir yazı ama uzunluğu kesinlikle bilinmez bir yazı ne kadar daha uzun olacak onu tabiki sonrasında göreceğiz ";
   // yazi1.ozellikDurumu("genisYazi",true);
    al.alanEkle(yazi1);
    final yaziKutusu yaz1=new yaziKutusu(10,400,120,20);
    al.alanEkle(yaz1);
    final yaziKutusu yaz2=new yaziKutusu(100,600,120,20);
    al.alanEkle(yaz2);
    final buton buton1=new buton(50,100,200,20);
    buton1.calismaTiklama = new Runnable(){
    
  public void run(){
    // burası fonksiyon kısmı bakalım ne olacak ne olmayacak.
    println("sistem başarılı bir çalışma işleminden geçmiş bulunmaktadır.");
  }};
  al.alanEkle(buton1);
  
  tasarlayici tasari= new tasarlayici(400,200,400,400);
  tasari.kutuEkle(new dikdortgen(0,10,50,50));
    tasari.kutuEkle(new dikdortgen(100,10,50,50));
  al.alanEkle(tasari);
 }// fonksiyon sonu
 
  
}// sınıf sonu
