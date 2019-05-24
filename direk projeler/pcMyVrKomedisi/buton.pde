class buton extends _elemanYapi{
 
  dikdortgen yaziAlani;
  // mouse hareketine göre şekillenecek bir yapı asıl renk yapısı olmak üzer üç renk değişkenimiz var
  color pasifRenk,aktifRenk,asilRenk;
  PGraphics grafik;
  String yazi;
  float yaziBoyutu=18;
 // ArrayList<Float> uzunluklar=new ArrayList<Float>();
  buton(float gx,float gy,float gw,float gh){
   mouseTiklamaDurumu=true;
   mouseHareketDurumu=true;
   yazi="";
   yaziAlani=new dikdortgen(2,2,gw-4,gh-4);
   alanim =new tekAlan(); 
   alanim.x=gx; alanim.y=gy; alanim.w=gw; alanim.h=gh;
   alanim.elemanim=this;
   
   // renk oluşumları kısmı
   pasifRenk=color(255);
   aktifRenk=color(0,0,255);
   asilRenk=pasifRenk;
   // grafik oluşturma için ilk işlemimizi yaptık
   grafigiOlustur(); 
  }//constructor


void draw(){
//  println("yazi kutusu kısmı çalıştı");s
grafik.beginDraw();
// tüm grafiksel işlemler burda bitiyor
  grafik.background(255);
  grafik.stroke(0);
  grafik.fill(asilRenk);
//  println(alanim.w);
  grafik.strokeWeight(4);
  grafik.rect(0,0,alanim.w,alanim.h);
  
  // Burdaki fili yazının görünmesi için siyah moda alıyoruz şimdilik.
  grafik.fill(0);
  grafik.textSize(yaziBoyutu);
  grafik.textAlign(LEFT, TOP);
  grafik.text(yazi,yaziAlani.x,0);
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

void mouseTiklamaFonksiyonu(int x,int y){ 
//println("x : " +x+ "y : "+y);
//println("kutuya göre x : " +(x-alanim.x)+ " kutuya göre y : "+(y-alanim.y));
//char b= yazi.charAt(imlecKonum);
//println(b);
float xDegeri=x-alanim.x;
//gelen y değerinin bir anlamı yok biz yinede bu değeri tutmak istiyoruz.
float uDegeri=y-alanim.y;
// bu yapı ileri ve geri yapılarını dinamik kullanmak için oluşturulan bir sorgudur.

// yukardaki bilgiler yazıkutusu yapılandırmasından kalanlardır kullanıp kullanılmayacağı ilerde farklılık gösterebilir amacıyla şimdilik yerli yerinde bırakılıyor
// sonrasında detaylı bir şekilde bir inceleme ve şekillenme işlemine tabi tututalabilir.
calismaTiklama.run();
}// fonksiyon sonu


  void mouseHareketFonksiyonu(int x,int y){ 
  // burda yapıyla dinamik çalışma için teknik bir renk değişimi uygulama işlemi uyguluyor olacağız gibi görünüyor.
  asilRenk=aktifRenk;
 // println("hareket fonksiyonu başarılı olarak çalıştı");
  }
  
    void aktiflikBitimiHareket(){ 
 // burda rengimizi geçmiş rengine çevirme işlemini yapacağız.
    asilRenk=pasifRenk;
  // println("aktiflik bitimi başarılı bir şekilde çalıştı");
  }

}// sınıf sonu
