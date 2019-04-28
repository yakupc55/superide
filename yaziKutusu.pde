class yaziKutusu extends _elemanYapi{
  float []yazia; // bu yapı achii değerlerine ait uzunlukları veriyor.
  dikdortgen imlec;
  dikdortgen yaziAlani;
  int sayacImlec;
  int imlecKonum; // bu hangi harften sonra imlecin geldiğini bilmek için oluşturuldu
  float imlecOncesi;
  float imlecSonrasi;
  PGraphics grafik;
  String yazi;
  boolean durumImlec=false;
  float yaziBoyutu=18;
  float toplamUzunluk;

  ArrayList<Float> uzunluklar=new ArrayList<Float>();
  yaziKutusu(float gx,float gy,float gw,float gh){
      yazi=""; toplamUzunluk=0; imlecOncesi=0; imlecOncesi=0;
      imlecKonum=-1;
      yaziAlani=new dikdortgen(2,2,gw-4,gh-4);
      // yazi sınırından dör kestik 2 önden iki sondan 2 tanesi alan kaybı
      // 2 tanesi ise boşluk oluşturmak için kayma yapıldı.
     anaKarekterGirisi = true;
     ozelKarekterGirisi = true;
       /*
   Kullanılacak yapılar true hale getiriliyor    
    */

   alanim =new tekAlan(); 
   alanim.x=gx; alanim.y=gy; alanim.w=gw; alanim.h=gh;
   alanim.elemanim=this;
   // grafik oluşturma için ilk işlemimizi yaptık
   grafigiOlustur();
   karekterhesap();
   imlecOlustur();
   sayacImlec=0;
 
  }//constructor

void karekterhesap(){
  textSize(yaziBoyutu);
  yazia=new float[352];
  //burda tab uzunluğunu ölçtük 
  float uzunluk= textWidth("  ");
    yazia[9]=uzunluk;
  for(int i=32;i<127;i++){
    //65535 
    char c=char(i);
    uzunluk= textWidth(c);
    yazia[i]=uzunluk;
 //   println (i+" .kareker"+c+" uzunluğu = "+uzunluk);
  }
  // burdaki güzel ve dinamik amaç 127 yedinin kullanılan bir basım karekteri olmaması
  for(int i=128;i<256;i++){
    char c=char(i);
    uzunluk= textWidth(c);
    yazia[i]=uzunluk;
   // println (i+" .kareker"+c+" uzunluğu = "+uzunluk);
  }
 yazia[287]=textWidth(char(287)); // ğ karekteri için
 yazia[351]=textWidth(char(351)); // ş karekteri için
 yazia[286]=textWidth(char(286)); // Ğ karekteri için
 yazia[350]=textWidth(char(350)); // Ş karekteri için
 yazia[304]=textWidth(char(304)); // İ karekteri için
 yazia[305]=textWidth(char(305)); // ı karekteri için
 
 // burada çeşitli deneme algoritmaları çalıştırılmaktadır.

}// fonksiyon sonu

void draw(){
//  println("yazi kutusu kısmı çalıştı");
  if(aktiflik){
grafik.beginDraw();
// tüm grafiksel işlemler burda bitiyor
  grafik.background(255);
  grafik.stroke(0);
  grafik.fill(255);
//  println(alanim.w);
  grafik.rect(0,0,alanim.w,alanim.h);
  
  // Burdaki fili yazının görünmesi için siyah moda alıyoruz şimdilik.
  grafik.fill(0);
  grafik.textSize(yaziBoyutu);
  grafik.textAlign(LEFT, TOP);
  grafik.text(yazi,yaziAlani.x,0);
  //text("aktif",alanim.x,alanim.y);
 if(sureDagilimi(20,15)){
  grafik.line(imlec.x,imlec.y,imlec.x,imlec.h);
 }  
//tüm grafiksel işlemlerin bundan önce bitmesi gerekiyor.  
grafik.endDraw();
  }// if sonu
image(grafik,alanim.x,alanim.y);
}// draw sonu

void anaKarekterFonksiyonu(int tus){
 //println("yazı kutusu kısmında başarılı bir çalışma");
 yazi+=key;
 uzunluklar.add(yazia[key]);
 toplamUzunluk+=yazia[key];

 // burdaki imlec sonrası toplam yapısı hesaplama algoritmalarını rahatlamak amacıyla yapılmıştır.
// println(uzunluklar.get(yazi.length()-1));
// println(yazi);
 if(toplamUzunluk>yaziAlani.w){
   yaziAlani.x=2-(toplamUzunluk-yaziAlani.w);
 }// if sonu
 // sağ tuş olaylarında yazi alani x değeri önemli olduğu için ondan sonra çalışacak şekilde ayarlandı
 sagTusOlaylari();
}// fonksiyon sonu

void ozelKarekterFonksiyonu(int tus){
  //println("başarılı bir şekilde çalıştı");
  if(tus==39){
    // 39 klavyeden sağ tuşu ifade ediyor.
    sagTusOlaylari();
  }
  else if(tus==37){
    // 37 klavyede sol tuşu ifade ediyor.
   solTusOlaylari();
  }
}


void sagTusOlaylari(){
  if(yazi.length()-1>imlecKonum){
   println("çalışma için uygun sağ tuş");
   imlecKonum++;
   imlecHesaplaIleri();
   teknikBilgilendirme();
  }
}

void solTusOlaylari(){
 if(imlecKonum>-1){
   println("çalışma için uygun sol tuş"); 
   imlecKonum--;
   imlecHesaplaGeri();
  teknikBilgilendirme();
  }
}

void teknikBilgilendirme(){
   println("imlec konum değeri : "+imlecKonum);
   println("imlec son değeri : "+imlecSonrasi);
   println("imlec on değeri : "+imlecOncesi);
   println("yazı alanı x : "+yaziAlani.x);
}

void imlecHesaplaIleri(){
  float ekKonum=yazia[int(yazi.charAt(imlecKonum))];
  println("ek konum : "+ekKonum);
  println("yazi length : "+yazi.length());
  if(yazi.length()-1>imlecKonum)
  imlecSonrasi-=ekKonum;
  imlecOncesi+=ekKonum;
  // 2 lik boşluk ile imlecin ulaştığı yer arasındaki mesafeyi toplamış oluyoruz.
  //sonradan yazi alan x eklediğimiz için oda orjinalinde 2 yi ekli verdiği için tekrar toplama
  // gereği duymadık
  imlec.x=imlecOncesi+yaziAlani.x;
}

void imlecHesaplaGeri(){
  // imlec konumun 1 ile toplanmasının sebebi geri gelme olayı öndeki karekterin uzunluğuna bağlı olduğu için
  float ekKonum=yazia[int(yazi.charAt(imlecKonum+1))];
  println("ek konum : "+ekKonum);
  imlecSonrasi+=ekKonum;
  imlecOncesi-=ekKonum;
  // 2 lik boşluk ile imlecin ulaştığı yer arasındaki mesafeyi toplamış oluyoruz.
  imlec.x=2+imlecOncesi;
}

void ilkCizim(){
  grafik.beginDraw();
// tüm grafiksel işlemler burda bitiyor
  grafik.background(255);
  grafik.stroke(0);
  grafik.fill(255);
//  println(alanim.w);
  grafik.rect(0,0,alanim.w,alanim.h);
  grafik.fill(0);
  grafik.textSize(yaziBoyutu);
  grafik.textAlign(LEFT, TOP);
  grafik.smooth();
  grafik.text(yazi,2,0);
//tüm grafiksel işlemlerin bundan önce bitmesi gerekiyor.  
grafik.endDraw();
image(grafik,alanim.x,alanim.y);
}

boolean anaKarekterGirisiKontrol(){
 return aktiflik;
}// fonksiyon sonu

boolean ozelKarekterGirisiKontrol(){
 return aktiflik;
}// fonksiyon sonu

void imlecOlustur(){
  // imlec öncelikle strokenin 1 biriminde dolayı 1 birim kısaltıldı. Sonrada 1 birim boşluk oluşturmak için
  // bir birim kısaltıldı böylelikle toplamda 2 birim kısaltama yapılmış oldu.
  imlec = new dikdortgen(2,2,2,alanim.h-2);
}//

void imlecGuncelle(){
  
}// fonksiyon sonu  

// bu fonksiyonun sürenin mantıksal olarak ayrılmasını sağlar ona göre bir çalışma mekanizmasında olmasını sağlar
boolean sureDagilimi(int x,int y){
  // öncelikle durumImlec yapısının true ve false yapısını kullanıyoruz
  //süre dağılımları false ve true olma sürelerini yapan yapının ana kısmıdır
 // println("gelen x değeri : "+ str(x) +"gelen y değeri : "+ str(y)+"gelen sayacImlec değeri : "+ str(sayacImlec)+"gelen durum değeri : "+ str(durumImlec));
  if(durumImlec){
   // println("sorgu içi başarılı çalışma");
    // öncelikle sayacImlecümüzün istenen son kısma gelip gelmediğini sayacImlec ediyoruz
    if(sayacImlec==x){
    // eğer istenen son değere geldiyse sayacImlec yapısının değerini değiştirip
    // sayacımızı sıfırlıyoruz
      durumImlec=false;
      sayacImlec=0;
    }
  }
  else{
    if(sayacImlec==y){
      durumImlec=true;
      sayacImlec=0;
    }
  }
  sayacImlec++;
  return durumImlec;
}// fonksiyon sonu

// bu ilk grafiksel oluşumu temsil ediyor.
void grafigiOlustur(){
  grafik = createGraphics(int(alanim.w),int(alanim.h));
  grafik.beginDraw();
  grafik.background(255);
  grafik.endDraw();
  ilkCizim();
}// fonksiyon sonu

void aktiflikBitimi(){
    ilkCizim();
}// fonksiyon sonu

}// sınıf sonu
