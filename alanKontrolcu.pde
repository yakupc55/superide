// alanlardaki kontrolü sağlamak için yapıldı.

class alanKontrolcu{
 int aktifAlan=0; //ana alan demek oluyor 
 // bu direk aktif olarak betimlenen alan ana alanı temsil ediyor.
 int sonAktifAlan=-1; // -1 de çevrim dışı bir yapılanma oluyor
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

void keyPressed(int tus){
  // println("alan kontrol içi kısmında başarılı bir çalışma");
  //println("yazılan karekter = "+key+"  sayısal karşılığı = "+str(int(key)));
 if(tus==CODED){
 //  println("yazılan özel karekter = "+keyCode+"  sayısal karşılığı = "+str(int(keyCode)));
 }
 // enter key number=10
 // silme numarası
 if((tus>=32 && tus<127)||(tus>=128 && tus<352)){
   // normal klavye girişi olduğunda olacak işlemler burada yapılandırılacak
 //     println("normal tuş girişi kısmında başarılı bir çalışma");
   for(int i = 0; i<alanlar.size();i++){
 //    println(i+" adlı sıraya göre değer "+str(alanlar.get(i).elemanim.anaKarekterGirisi));
   if(alanlar.get(i).elemanim.anaKarekterGirisiKontrol()){
 //     println("if  kısmında başarılı bir çalışma");
   alanlar.get(i).elemanim.anaKarekterFonksiyonu(tus);
     break;
   }
  }// for sonu
 }
 
 if(key==10){
   
   
 }// entera basıldığında olacak
 
  if(key==8){
   // kod aktif alana gönderilip öyle çalıştırılacak.
   
 }// silme olduğunda olacaklar
  
}

void mousePressed(){

 
}//fonksiyon sonu
 void mousePressed(int x, int y){
 // ilk kısım eski aktif kısmın değiştirilmesi ve yeni aktif kısmın atanması
 //aktif alan ataması için alan taraması işlemi yapılacak.
 for(int i = 0; i<alanlar.size();i++){
  if(alanTaramaSonucu(i,x,y)){
    
    // son aktif olan alanı devre dışı bırakıyoruz. Şimdiki mimaride sadece tek yönlü bir aktif mekanizmaya odaklanmış durumdayız.
    if(sonAktifAlan>=0){
      // burda aktif alanımızı devre dışı bırakıyoruz.
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
