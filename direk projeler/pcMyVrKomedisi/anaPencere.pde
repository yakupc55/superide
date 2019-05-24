class anaPencere extends normalPencere{
 int ekipSayisi=0;
 int maxEkipSayisi=2;
 ArrayList<String> ekipler= new ArrayList<String>();
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
    final yaziAlani yazi1=new yaziAlani(400,100,460,50);
    yazi1.yazi="İLK İŞLEMLER ALANI";
    yazi1.yaziBoyutu=48;
   // yazi1.ozellikDurumu("genisYazi",true);
    al.alanEkle(yazi1);
    
    final yaziAlani yazi2=new yaziAlani(400,180,400,150);
    yazi2.yazi="YARIŞAN EKİPLER : \n";
    yazi2.yaziBoyutu=24;
    yazi2.ozellikDurumu("genisYazi",true);
    al.alanEkle(yazi2);
    
    final yaziAlani yEkipno=new yaziAlani(400,330,80,20);
    yEkipno.yazi="Ekip no:";
    yEkipno.yaziBoyutu=16;
   // yEkipno.ozellikDurumu("genisYazi",true);
    al.alanEkle(yEkipno);
    
    final yaziKutusu ykEkipno=new yaziKutusu(480,330,120,20);
    al.alanEkle(ykEkipno);
    
    final yaziAlani yEkipIsmi=new yaziAlani(400,350,80,20);
    yEkipIsmi.yazi="Ekip ismi:";
    yEkipIsmi.yaziBoyutu=16;
   // yEkipIsmi.ozellikDurumu("genisYazi",true);
    al.alanEkle(yEkipIsmi);
    
    final yaziKutusu ykEkipIsmi=new yaziKutusu(480,350,120,20);
    al.alanEkle(ykEkipIsmi);
    
     final buton buton1=new buton(520,370,40,20);
    buton1.yazi="Ekle";
    buton1.yaziBoyutu=16;
    buton1.calismaTiklama = new Runnable(){
    
  public void run(){
    // burası fonksiyon kısmı bakalım ne olacak ne olmayacak.
    println("sistem başarılı bir çalışma işleminden geçmiş bulunmaktadır.");
  }};
  al.alanEkle(buton1);
    
    final yaziAlani yVrip=new yaziAlani(400,400,100,20);
    yVrip.yazi="vr ip ve port:";
    yVrip.yaziBoyutu=16;
   // yVrip.ozellikDurumu("genisYazi",true);
    al.alanEkle(yVrip);
    
    final yaziKutusu ykVrip=new yaziKutusu(510,400,180,20);
    al.alanEkle(ykVrip);
    
   final yaziAlani yOkip=new yaziAlani(400,420,110,20);
    yOkip.yazi="ok ip ve port:";
    yOkip.yaziBoyutu=16;
   // yOkip.ozellikDurumu("genisYazi",true);
    al.alanEkle(yOkip);
    
     final yaziKutusu ykOkip=new yaziKutusu(510,420,180,20);
    al.alanEkle(ykOkip);
    
         final buton buton3=new buton(580,440,55,20);
    buton3.yazi="Bağlan";
    buton3.yaziBoyutu=16;
    buton3.calismaTiklama = new Runnable(){
    
  public void run(){
    // burası fonksiyon kısmı bakalım ne olacak ne olmayacak.
    println("sistem başarılı bir çalışma işleminden geçmiş bulunmaktadır.");
  }};
  al.alanEkle(buton3);
    
    final yaziAlani yazi7=new yaziAlani(400,500,500,50);
    yazi7.yazi="açıklama satırı";
    yazi7.yaziBoyutu=20;
   // yazi7.ozellikDurumu("genisYazi",true);
    al.alanEkle(yazi7);
    
   
  
   final buton buton2=new buton(520,560,110,20);
    buton2.yazi="Oyunu Başlat";
    buton2.yaziBoyutu=16;
    buton2.calismaTiklama = new Runnable(){
    
  public void run(){
    // burası fonksiyon kısmı bakalım ne olacak ne olmayacak.
    println("sistem başarılı bir çalışma işleminden geçmiş bulunmaktadır.");
  }};
  al.alanEkle(buton2);
  

  
 }// fonksiyon sonu
 
  
}// sınıf sonu
