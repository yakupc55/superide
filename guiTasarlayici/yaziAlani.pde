class yaziAlani extends _elemanYapi{
 
  dikdortgen imlec;
  dikdortgen yaziAlani;
  PGraphics grafik;
  String yazi;
  float yaziBoyutu=18;

  // burda modlara ait boolean değişkenleri yer almaktadır.
  boolean genisYazi=false;
 // ArrayList<Float> uzunluklar=new ArrayList<Float>();
  yaziAlani(float gx,float gy,float gw,float gh){
   mouseTiklamaDurumu=true;
   yazi="";
   yaziAlani=new dikdortgen(2,2,gw-4,gh-4);
   alanim =new tekAlan(); 
   alanim.x=gx; alanim.y=gy; alanim.w=gw; alanim.h=gh;
   alanim.elemanim=this;
   // grafik oluşturma için ilk işlemimizi yaptık
   grafigiOlustur();
 
 
  }//constructor



void draw(){
//  println("yazi alanı kısmı çalıştı");
grafik.beginDraw();
// tüm grafiksel işlemler burda bitiyor
  grafik.background(0,0);
  grafik.stroke(255);
  // Burdaki fili yazının görünmesi için siyah moda alıyoruz şimdilik.
  grafik.fill(255);
  grafik.textSize(yaziBoyutu);
  grafik.textAlign(LEFT, TOP);
  
  if(!genisYazi)
  grafik.text(yazi,0,0);
  else
  grafik.text(yazi,0,0,alanim.w,alanim.h);
  //text("aktif",alanim.x,alanim.y);
 
//tüm grafiksel işlemlerin bundan önce bitmesi gerekiyor.  
grafik.endDraw();
image(grafik,alanim.x,alanim.y);
}// draw sonu

// bu ilk grafiksel oluşumu temsil ediyor.
void grafigiOlustur(){
  grafik = createGraphics(int(alanim.w),int(alanim.h));
  grafik.beginDraw();
  grafik.background(255);
  grafik.endDraw();
}// fonksiyon sonu

  void ozellikDurumu(String mod,boolean durum){
  switch(mod){
  case "genisYazi" : genisYazi=durum; break;
  default : println("yazı Alanında öyle bir özellik bulunmadı"); break;
  }// switch sonu
  
  }// fonksiyon sonu

}// sınıf sonu
