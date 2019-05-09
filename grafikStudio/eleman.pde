interface eleman{
  void draw();
}

class _elemanYapi implements eleman{
  // burdan itibaren çalışma için ön görülmüş yapılar çalıştırılmak üzere bir şekillendirme yapılmıştır.
  Runnable calismaTiklama;
  _alanYapi alanim; 
  boolean anaKarekterGirisi=false;
  boolean anaKarekterGirisiBasili=false;
  boolean ozelKarekterGirisi=false;
  boolean silmeTusuGirisi=false;
  boolean mouseTiklamaDurumu=false;

 //bu aktiflik tıklanmayla aktiflik durumuna geçen kodlar için geçerli bir kod yapısını oluşturuyor.
  boolean aktiflik=false;
 // bu aktiflik durumu ise mouse hareketinde oluşacak durumları içeriyor.
 // örnek vermek gerekirse bir butonun üzerine gelidiğini belli eden bir renk değişimi oluşumu olması durumu örnek verilebilir.
  boolean aktiflikHareket=false;
  boolean mouseHareketDurumu=false;
  // gerekli fonksiyonlar
  void setup(){ println("üst sınıftaki çalıştı");   }
  void draw(){ println("üst sınıftaki çalıştı");   }
  void anaKarekterFonksiyonu(){    println("üst sınıftaki anakarekter fonksiyonu çalıştı"); }
  void anaKarekterFonksiyonu(int tus){    println("üst sınıftaki ana karekter fonksiyonu çalıştı"); }
  void anaKarekterFonksiyonuBasili(int tus,int no){    println("üst sınıftaki anakarekter basili fonksiyonu çalıştı"); }
  void ozelKarekterFonksiyonu(){    println("üst sınıftaki özel karekter fonksiyonu çalıştı"); }
  void ozelKarekterFonksiyonu(int tus){    println("üst sınıftaki özel karekter fonksiyonu çalıştı"); }
  void silmeTusuFonksiyonu(){    println("üst sınıftaki silme tuşu fonksiyonu çalıştı"); }
  
  void aktiflikBitimi(){ println("üst sınıftaki aktiflik bitimi fonksiyonu çalıştı");   }
  void aktiflikBitimiHareket(){ println("üst sınıftaki mouse hareket aktiflik bitimi fonksiyonu çalıştı");   }
  
  void mouseTiklamaFonksiyonu(int x,int y){ println("üst sınıftaki mouse tıklama fonksiyonu çalıştı");   }
  void mouseHareketFonksiyonu(int x,int y){ println("üst sınıftaki mouse hareket fonksiyonu çalıştı");   }

  boolean anaKarekterGirisiKontrol(){ println("üst sınıftaki ana karekter girişi kontrol fonksiyonu çalıştı"); return false;  }
  boolean anaKarekterGirisiKontrolBasili(){ println("üst sınıftaki özel karekter girişi  kontrol fonksiyonu çalıştı"); return false;  }
  boolean ozelKarekterGirisiKontrol(){ println("üst sınıftaki ozel karekter girişi kontrol yapısı çalıştı"); return false;  }
  boolean silmeTusuGirisiKontrol(){ println("üst sınıftaki silme tuşu kontrol girişi çalıştı"); return false;  }
  
  // bu kısım özel yapılandırmaların bulunduğu kod kısımlarından başlıyor.
  void ozellikDurumu(String mod,boolean durum){println("üst sınıftaki özellik durumu çalıştı"); }
  
}
