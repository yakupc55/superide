interface eleman{
  void draw();
}

class _elemanYapi implements eleman{
  _alanYapi alanim; 
  boolean anaKarekterGirisi=false;
  boolean ozelKarekterGirisi=false;
  boolean aktiflik=false;
  // gerekli fonksiyonlar
  void setup(){ println("üst sınıftaki çalıştı");   }
  void draw(){ println("üst sınıftaki çalıştı");   }
  void anaKarekterFonksiyonu(){    println("üst sınıftaki çalıştı"); }
  void anaKarekterFonksiyonu(int tus){    println("üst sınıftaki çalıştı"); }
  void ozelKarekterFonksiyonu(){    println("üst sınıftaki çalıştı"); }
  void ozelKarekterFonksiyonu(int tus){    println("üst sınıftaki çalıştı"); }
  void aktiflikBitimi(){ println("üst sınıftaki çalıştı");   }

  boolean anaKarekterGirisiKontrol(){ println("üst sınıftaki çalıştı"); return false;  }
  boolean ozelKarekterGirisiKontrol(){ println("üst sınıftaki çalıştı"); return false;  }
}
