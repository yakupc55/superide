// bu sınıfın amacı yapılara göre inceleme yapmak için.

interface alan{

  
  
}// arayüz sonu

class _alanYapi implements alan{
  _elemanYapi elemanim; // her yapınin kendine ait bir elemanı olmuş oluyor
  float x,y,w,h; // teknik kare alanı nı ifade ediyor.
  boolean _cokluluk; // alanın çoklu yapı alıp almadığını kontrol ediyoruz.
}// sınıf sonu

class tekAlan extends _alanYapi {
  
  tekAlan(){
    _cokluluk=false;
  }// constructor sonu
}// sınıf sonu

class cokAlan extends _alanYapi{
  
  cokAlan(){
    _cokluluk=true;
  }// constructor sonu
  
}// sınıf sonu
