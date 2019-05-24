class tasarlayici extends _elemanYapi{

  PGraphics grafik;

ArrayList<dikdortgen> kutular=new ArrayList<dikdortgen>();
  tasarlayici(float gx,float gy,float gw,float gh){
   
   alanim =new tekAlan(); 
   alanim.x=gx; alanim.y=gy; alanim.w=gw; alanim.h=gh;
   alanim.elemanim=this;
    
   // teknik izin bakışı yapısı için ekleme işlemlerimiz yaptık 
  mouseSuruklemeDurumu=true;
   // grafik oluşturma için ilk işlemimizi yaptık
   grafigiOlustur(); 
  }//constructor


void draw(){
//  println("yazi kutusu kısmı çalıştı");s
grafik.beginDraw();
// tüm grafiksel işlemler burda bitiyor
  grafik.background(255);
  grafik.stroke(0);
//  println(alanim.w);
  grafik.rect(0,0,alanim.w,alanim.h);
  
  // Burdaki fili yazının görünmesi için siyah moda alıyoruz şimdilik.
  grafik.fill(255);
  //text("aktif",alanim.x,alanim.y);
 // kutu çizimlerine burda başlıyoruz.
 for(int i=0;i<kutular.size();i++){
   dikdortgen a=kutular.get(i);
   grafik.rect(a.x,a.y,a.w,a.h);   
 }// for sonu
 
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

void kutuEkle(dikdortgen kutu){
  kutular.add(kutu);
}

// sondaki iki değer ise mousenin hangi yönde ne kadar hareket ettiğini açıklağa kovuşturmak amacıyladır
void mouseSuruklemeFonksiyonu(int x,int y, int xg, int yg){ 
  println("iç yapı başarılı bir şekilde çalışıyor.");
for(int i=0;i<kutular.size();i++){
   if(alanTaramaSonucu(i,x,y)){
     println("doğrulanan alan mevcut");
     kutular.get(i).x+=xg;
     kutular.get(i).y+=yg;
     listeTazele(i);
     break;
   }
 }// for sonu
 
}// fonksiyon sonu

boolean mouseSuruklemeGirisiKontrol(){
return true;
}// fonksiyon sonu

   boolean alanTaramaSonucu(int gelenIndaks,int x,int y){
     int ax=int(x-alanim.x); int ay=int(y-alanim.y);
  dikdortgen a=kutular.get(gelenIndaks);
  if(a.x<=ax && a.y<=ay && a.x+a.w>=ax && a.y+a.h>=ay){
    return true;
  }// if sonu
  else{
    return false;
  }// else sonu
}// fonksiyon sonu

void listeTazele(int i){
  // burda i yi 0 dan büyük tutmamızın amacı boş yere bir döngü değişimi oluşturmamak
  // çünkü burda seçili değeri tekrar sıfıra getiriyoruz.
  if(i>0){
    dikdortgen yeniyer=kutular.get(i);
    kutular.remove(i);
    kutular.add(0,yeniyer);
  }// if sonu
}// fonksiyon sonu

}// sınıf sonu

// sonrasında bu dıkdortgen yapılandırmaları ozel bir yapı haline gelecek bir yapı taşına dönecek şuan için görünen o gibi görünüyor
// ama sonrasında fikirsel bir değişlikliğede hızlı bir geçiş olabilir.
