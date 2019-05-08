interface eleman{
  void draw();
}

class _elemanYapi implements eleman{
  _alanYapi alanim; 
  boolean anaKarekterGirisi=false;
  boolean anaKarekterGirisiBasili=false;
  boolean ozelKarekterGirisi=false;
  boolean silmeTusuGirisi=false;
  boolean mouseTiklamaDurumu=false;
  boolean aktiflik=false;
  // gerekli fonksiyonlar
  void setup(){ println("üst sınıftaki çalıştı");   }
  void draw(){ println("üst sınıftaki çalıştı");   }
  void anaKarekterFonksiyonu(){    println("üst sınıftaki çalıştı"); }
  void anaKarekterFonksiyonu(int tus){    println("üst sınıftaki çalıştı"); }
  void anaKarekterFonksiyonuBasili(int tus,int no){    println("üst sınıftaki çalıştı"); }
  void ozelKarekterFonksiyonu(){    println("üst sınıftaki çalıştı"); }
  void ozelKarekterFonksiyonu(int tus){    println("üst sınıftaki çalıştı"); }
  void silmeTusuFonksiyonu(){    println("üst sınıftaki çalıştı"); }
  void aktiflikBitimi(){ println("üst sınıftaki çalıştı");   }
  void mouseTiklamaFonksiyonu(int x,int y){ println("üst sınıftaki çalıştı");   }

  boolean anaKarekterGirisiKontrol(){ println("üst sınıftaki çalıştı"); return false;  }
  boolean anaKarekterGirisiKontrolBasili(){ println("üst sınıftaki çalıştı"); return false;  }
  boolean ozelKarekterGirisiKontrol(){ println("üst sınıftaki çalıştı"); return false;  }
  boolean silmeTusuGirisiKontrol(){ println("üst sınıftaki çalıştı"); return false;  }
}
