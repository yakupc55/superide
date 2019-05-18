// alanlardaki kontrolü sağlamak için yapıldı. //<>//

class alanKontrolcu{
  boolean ctrlDurumu=false;
  boolean altDurumu=false;
  boolean shiftDurumu=false;
  int durumNo=0;
 int aktifAlan=0; //ana alan demek oluyor 
 // bu direk aktif olarak betimlenen alan ana alanı temsil ediyor.
 int sonAktifAlan=-1; // -1 de çevrim dışı bir yapılanma oluyor
 // eğer aktif edilme alanını kontrol eden for boş dönerse yapılmak istenenler için oluşturulan bir değişken
 boolean bosForAktiflik=true; 
 
 // mouse hareketi sırasında devereye girecek yapıları oluşturmaya hızlı bir şekilde başlıyoruz.
 boolean bosForAktiflikHareket=false;
 // son aktiflik durumuna göre en son aktifliği kapamak için gerekli bir alan
 int sonAktifAlanHareket=-1;
ArrayList<_alanYapi> alanlar=new ArrayList<_alanYapi>();
 alanKontrolcu(){
 //sisteme ana alanı eklemiş oluyoruz.   
 }// fonsksiyon sonu
  
  void alanEkle(_alanYapi gelen){
    
    alanlar.add(gelen);
  }// fonksiyon sonu
  
   void alanEkle(_elemanYapi gelen){
    
    alanlar.add(gelen.alanim);
  }// fonksiyon sonu
  
  void draw(){
    
   for(int i = 0; i<alanlar.size();i++){
   alanlar.get(i).elemanim.draw(); //<>//
  }// for sonu
}// fonksiyon sonu

void keyPressed(){
  
  
}// fonksiyon sonu
void keyReleased(int tus){
 //  println("yazılan karekter = "+tus+"  sayısal karşılığı = "+str(int(tus)));
 
  if(tus==CODED){
 //  println("yazılan özel karekter = "+keyCode+"  sayısal karşılığı = "+str(int(keyCode)));
   
  }
   if (tus == CODED) {
   if(keyCode>=16 && keyCode<=18){
  switch(keyCode){
  case 16: shiftDurumu=false; break;    
  case 17: ctrlDurumu=false; break;  
  case 18: altDurumu=false; break;  
  }// switch sonu
   }// if sonu
   }// if sonu
  
}// fonksiyon sonu

//eğer her hangi basılı tuş durumu varsa onu kontrol etmemizi sağlayacak
boolean basiliKarekter(){
 //println("ctrl durumu : "+ctrlDurumu+"alt durumu : "+altDurumu+"shift durumu : "+shiftDurumu);
durumNo=((ctrlDurumu==true)?4:0)+((altDurumu==true)?2:0)+((shiftDurumu==true)?1:0);
//println(durumNo);
return (ctrlDurumu||shiftDurumu||altDurumu);

}

void keyPressed(int tus){
  // println("alan kontrol içi kısmında başarılı bir çalışma");
//  println("yazılan karekter = "+key+"  sayısal karşılığı = "+str(int(key)));
  if(basiliKarekter()){
  //  println("basili karekter çalışması başarılı");
  if(tus==CODED){
  // println("yazılan özel karekter = "+keyCode+"  sayısal karşılığı = "+str(int(keyCode)));
   //17 ctrl ve 18 alt oluyo shift ise 16 oluyo
if(keyCode>=16 && keyCode<=18){
 // println("buraya girdi");
  switch(keyCode){
  case 16: shiftDurumu=true; break;    
  case 17: ctrlDurumu=true; break;  
  case 18: altDurumu=true; break;  
  }
  
}// if sonu
else{
for(int i = 0; i<alanlar.size();i++){
  //   println(i+" adlı sıraya göre değer "+str(alanlar.get(i).elemanim.anaKarekterGirisi));
  if( alanlar.get(i).elemanim.ozelKarekterGirisi){
   if(alanlar.get(i).elemanim.ozelKarekterGirisiKontrol() ){
 //     println("if  kısmında başarılı bir çalışma");
   alanlar.get(i).elemanim.ozelKarekterFonksiyonu(keyCode);
     break;
   }// ikinci kontrol ifi
  } // ilk kontrol ifi
  
  }// for sonu
 }// if sonu
 }// else sonu
 // enter key number=10
 // silme numarası
 if((tus>=32 && tus<127)||(tus>=128 && tus<352)){
   // normal klavye girişi olduğunda olacak işlemler burada yapılandırılacak
 //     println("normal tuş girişi kısmında başarılı bir çalışma");
   for(int i = 0; i<alanlar.size();i++){
   //  println(i+" adlı sıraya göre değer "+str(alanlar.get(i).elemanim.anaKarekterGirisi));
   // ifler önceden birleşikti ama üst fonksiyon çalıştıma mekanizmasının da devreye girmesinden kaynaklı olarak 
   // iki parçaya ayrılarak iki denetimli kontrol yapısı oluşturuldu.
   if(alanlar.get(i).elemanim.anaKarekterGirisiBasili){
   if(alanlar.get(i).elemanim.anaKarekterGirisiKontrolBasili() ){
      //println("if  kısmında başarılı bir çalışma");
   alanlar.get(i).elemanim.anaKarekterFonksiyonuBasili(tus,durumNo);
     break;
   }// ikinci kontrol
   }// ilk kontrol
  }// for sonu
 }

  }//else sonu
  
  
  
  else{
 if(tus==CODED){
  // println("yazılan özel karekter = "+keyCode+"  sayısal karşılığı = "+str(int(keyCode)));
   //17 ctrl ve 18 alt oluyo shift ise 16 oluyo
if(keyCode>=16 && keyCode<=18){
  switch(keyCode){
  case 16: shiftDurumu=true; break;    
  case 17: ctrlDurumu=true; break;  
  case 18: altDurumu=true; break;  
  }
  
}// if sonu
else{
for(int i = 0; i<alanlar.size();i++){
  //   println(i+" adlı sıraya göre değer "+str(alanlar.get(i).elemanim.anaKarekterGirisi));
  if(alanlar.get(i).elemanim.ozelKarekterGirisi){
   if(alanlar.get(i).elemanim.ozelKarekterGirisiKontrol() ){
 //     println("if  kısmında başarılı bir çalışma");
   alanlar.get(i).elemanim.ozelKarekterFonksiyonu(keyCode);
     break;
   }// ikinci kontrol ifi
  }// ilk kontrol ifi sonu
  }// for sonu
 }// if sonu
 }// else sonu
 // enter key number=10
 // silme numarası
 if((tus>=32 && tus<127)||(tus>=128 && tus<352)){
   // normal klavye girişi olduğunda olacak işlemler burada yapılandırılacak
 //     println("normal tuş girişi kısmında başarılı bir çalışma");
   for(int i = 0; i<alanlar.size();i++){
 //    println(i+" adlı sıraya göre değer "+str(alanlar.get(i).elemanim.anaKarekterGirisi));
 if(alanlar.get(i).elemanim.anaKarekterGirisi){
   if(alanlar.get(i).elemanim.anaKarekterGirisiKontrol()){
 //     println("if  kısmında başarılı bir çalışma");
   alanlar.get(i).elemanim.anaKarekterFonksiyonu(tus);
     break;
   }// ikinci kontrol ifi
 }// ilk kontrol ifi
  }// for sonu
 }
 

  }//else sonu
  
// Burda basılı olsada olmasada aynı yapıya sahip kodların çalışma mekanizması incelenecektir.  
if(tus<32){
  
   if(tus==10){
   
   
 }// entera basıldığında olacak
 
  else if(tus==8){
   // kod aktif alana gönderilip öyle çalıştırılacak.
   for(int i = 0; i<alanlar.size();i++){
  //   println(i+" adlı sıraya göre değer "+str(alanlar.get(i).elemanim.anaKarekterGirisi));
  if(alanlar.get(i).elemanim.silmeTusuGirisi){
   if(alanlar.get(i).elemanim.silmeTusuGirisiKontrol()){
 //     println("if  kısmında başarılı bir çalışma");
   alanlar.get(i).elemanim.silmeTusuFonksiyonu();
     break;
   }// ikinci if sonu
  } // ilk if sonu
  }// for sonu
 }// silme olduğunda olacaklar
 
 else if(tus==3 || tus==22 || tus==24 ){
  // ctrl+ v = 22, ctrl + c=3, ctrl +x = 24
      for(int i = 0; i<alanlar.size();i++){
 //    println(i+" adlı sıraya göre değer "+str(alanlar.get(i).elemanim.anaKarekterGirisi));
 if(alanlar.get(i).elemanim.kopyalamaYapistirmaGirisi){
   if(alanlar.get(i).elemanim.kopyalamaYapistirmaGirisiKontrol()){
 //     println("if  kısmında başarılı bir çalışma");
   alanlar.get(i).elemanim.kopyalamaYapistirmaFonksiyonu(tus);
     break;
   }// ikici if sonu
 }// ilk if onu
  }// for sonu
 }
 
} // if sonu


}// fonksiyon sonu

void mousePressed(){

 
}//fonksiyon sonu
 void mousePressed(int x, int y){
 // ilk kısım eski aktif kısmın değiştirilmesi ve yeni aktif kısmın atanması
 //aktif alan ataması için alan taraması işlemi yapılacak.
 bosForAktiflik=true;
 for(int i = 0; i<alanlar.size();i++){
  if(alanTaramaSonucu(i,x,y)){
    bosForAktiflik=false;
    // son aktif olan alanı devre dışı bırakıyoruz. Şimdiki mimaride sadece tek yönlü bir aktif mekanizmaya odaklanmış durumdayız.
    if(sonAktifAlan>=0){
      // burda aktif alanımızı devre dışı bırakıyoruz.
      if(alanlar.get(sonAktifAlan).elemanim.mouseTiklamaDurumu)
      alanlar.get(sonAktifAlan).elemanim.mouseTiklamaFonksiyonu(x,y);
      
      alanlar.get(sonAktifAlan).elemanim.aktiflik=false;
      alanlar.get(sonAktifAlan).elemanim.aktiflikBitimi();
    }
    // dek gelen alanımızı aktif duruma getiriyoruz.
    alanlar.get(i).elemanim.aktiflik=true;
    
    // şimdi son aktif alan kaydını da yapıyoruz.
    sonAktifAlan=i;
    // eğer aktiflik alanını bulduysak for döngüsünü artık sonlandıra biliriz.
    break;
  }
}//for sonu
if(sonAktifAlan>=0 && bosForAktiflik==true){
  //öncelikle son aktif alanı kapattık sonrada aktif olacak bir alan kalmadığı için son aktif alanıda -1 leyerek kapatmış olduk.
  alanlar.get(sonAktifAlan).elemanim.aktiflik=false;
  alanlar.get(sonAktifAlan).elemanim.aktiflikBitimi();
  sonAktifAlan=-1;
}
// hiç bir alana dek gelmese dahi son aktif alanı kapatıyoruz. son aktifliği ise -1 yapıyoruz.

}// fonksiyon sonu


void mouseMoved(int x,int y){
   // sistem şuan dinamik olarak çalışır durumda.
   bosForAktiflikHareket=true;
   for(int i = 0; i<alanlar.size();i++){
  if(alanTaramaSonucu(i,x,y)){
    
   bosForAktiflikHareket=false;
    if(sonAktifAlanHareket>=0){
      // son aktif alan değişmediyse her hangi bir değişikliğe gidilmesin diyoruz
      if(alanlar.get(sonAktifAlanHareket).elemanim.mouseHareketDurumu){ 
      alanlar.get(sonAktifAlanHareket).elemanim.mouseHareketFonksiyonu(x,y);
      //  println("bu kısım çalışması başarılı");
      
      if(sonAktifAlanHareket!=i){
      alanlar.get(sonAktifAlanHareket).elemanim.aktiflikHareket=false;
      alanlar.get(sonAktifAlanHareket).elemanim.aktiflikBitimiHareket();
      }// aktif alan değişmediyse her hangi bir bitirme olayı yapılmasın
      
      }//if sonu
    }// son aktiflik ifi 
    
    alanlar.get(i).elemanim.aktiflikHareket=true;
    
    sonAktifAlanHareket=i;
    
  }// if sonu
   }// for sonu
   
  if(sonAktifAlanHareket>=0 && bosForAktiflikHareket==true &&  alanlar.get(sonAktifAlanHareket).elemanim.mouseHareketDurumu ){
  //öncelikle son aktif alanı kapattık sonrada aktif olacak bir alan kalmadığı için son aktif alanıda -1 leyerek kapatmış olduk.
  
  alanlar.get(sonAktifAlanHareket).elemanim.aktiflikHareket=false;
  alanlar.get(sonAktifAlanHareket).elemanim.aktiflikBitimiHareket();
  sonAktifAlanHareket=-1;
}//if sonu

}// fonksiyon sonu
  

boolean alanTaramaSonucu(int gelenIndaks,int x,int y){
  _alanYapi a=alanlar.get(gelenIndaks);
  if(a.x<=x && a.y<=y && a.x+a.w>=x && a.y+a.h>=y){
    return true;
  }// if sonu
  else{
    return false;
  }// else sonu
}// fonksiyon sonu

}//class sonu
