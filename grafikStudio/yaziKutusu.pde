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
  float ekKonum;
 // ArrayList<Float> uzunluklar=new ArrayList<Float>();
  yaziKutusu(float gx,float gy,float gw,float gh){
      yazi=""; toplamUzunluk=0; imlecOncesi=0; imlecOncesi=0;
      imlecKonum=-1;
 
      yaziAlani=new dikdortgen(2,2,gw-4,gh-4);
      // yazi sınırından dör kestik 2 önden iki sondan 2 tanesi alan kaybı
      // 2 tanesi ise boşluk oluşturmak için kayma yapıldı.
     anaKarekterGirisi = true;
     ozelKarekterGirisi = true;
     silmeTusuGirisi=true;
     anaKarekterGirisiBasili = true;
     mouseTiklamaDurumu=true;
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
 if((imlecKonum+1)==yazi.length()){
 yazi+=char(tus);
// uzunluklar.add(yazia[key]);
 toplamUzunluk+=yazia[char(tus)];

 // burdaki imlec sonrası toplam yapısı hesaplama algoritmalarını rahatlamak amacıyla yapılmıştır.
// println(uzunluklar.get(yazi.length()-1));
// println(yazi);
//yazi alanını çeşitli durumlarda tekrar kontrol etmek için böyle bir yönteme başvuruldu.
 yaziAlaniKontrol();
 // sağ tuş olaylarında yazi alani x değeri önemli olduğu için ondan sonra çalışacak şekilde ayarlandı
 sagTusOlaylari();
 }
 else{
  
  karekterEkleme(tus); 
  toplamUzunluk+=yazia[char(tus)];
 }
// println(imlecKonum);
 
}// fonksiyon sonu

void silmeTusuFonksiyonu(){
if(yazi.length()>0){


imlecHesaplaSilme(int(yazi.charAt(imlecKonum)));
//println(imlecKonum);
//println(yazi.charAt(imlecKonum));

yazi= yazi.substring(0,imlecKonum)+yazi.substring(imlecKonum+1,yazi.length());
imlecKonum--;
//teknikBilgilendirme();
}// if sonu
}//fonksiyon sonu

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

void yaziAlaniKontrol(){
  if(toplamUzunluk>yaziAlani.w){
   yaziAlani.x=2-(toplamUzunluk-yaziAlani.w);
 }// if sonu
}// fonksiyon sonu

void karekterEkleme(int tus){
  if(imlecKonum==-1){
    
 yazi=char(key)+yazi;
  }
  else{
  yazi=yazi.substring(0,imlecKonum+1)+char(key)+yazi.substring(imlecKonum+1,yazi.length());
  }
  imlecKonum++;
  imlecHesaplaIleri();
 // teknikBilgilendirme();
}

void sagTusOlaylari(){
  if(yazi.length()-1>imlecKonum){
 //  println("çalışma için uygun sağ tuş");
   imlecKonum++;
   imlecHesaplaIleri();
  // teknikBilgilendirme();
  }
}

void solTusOlaylari(){
 if(imlecKonum>-1){
 //  println("çalışma için uygun sol tuş"); 
   imlecKonum--;
   imlecHesaplaGeri();
//  teknikBilgilendirme();
  }
}
void imlecHesaplaSilme(int no){
  float uzunluk=yazia[no];
  imlecOncesi-=uzunluk;
  toplamUzunluk-=uzunluk;
  imlec.x=imlecOncesi+yaziAlani.x;
  imlecDuzenKontrol();
//  teknikBilgilendirme();
}

void teknikBilgilendirme(){
   println("imlec konum değeri : "+imlecKonum);
   println("imlec son değeri : "+imlecSonrasi);
   println("imlec on değeri : "+imlecOncesi);
   println("yazı alanı x : "+yaziAlani.x);
   println("imlec x değeri :"+imlec.x);
   println("imlec yazi alanı w :"+yaziAlani.w);
}

void imlecHesaplaIleri(){
  float ekKonum=yazia[int(yazi.charAt(imlecKonum))];
 // println("ek konum : "+ekKonum);
 // println("yazi length : "+yazi.length());
  if(yazi.length()-1>imlecKonum)
  imlecSonrasi-=ekKonum;
  imlecOncesi+=ekKonum;
  // 2 lik boşluk ile imlecin ulaştığı yer arasındaki mesafeyi toplamış oluyoruz.
  //sonradan yazi alan x eklediğimiz için oda orjinalinde 2 yi ekli verdiği için tekrar toplama
  // gereği duymadık
  imlec.x=imlecOncesi+yaziAlani.x;
  imlecDuzenKontrol();
}

void imlecHesaplaGeri(){
  // imlec konumun 1 ile toplanmasının sebebi geri gelme olayı öndeki karekterin uzunluğuna bağlı olduğu için
  ekKonum=yazia[int(yazi.charAt(imlecKonum+1))];
  println("ek konum : "+ekKonum);
  imlecSonrasi+=ekKonum;
  imlecOncesi-=ekKonum;
  // 2 lik boşluk ile imlecin ulaştığı yer arasındaki mesafeyi toplamış oluyoruz.
  imlec.x=imlecOncesi+yaziAlani.x;
  // imleçle ilgili ekstra durumların görülmesinde teknik düzenlemenin hızlı yapılması için gerekli görünenler
  imlecDuzenKontrol();
}

void imlecDuzenKontrol(){
  if(imlec.x<2){
   // imlec eğer 2 den düşük bir noktaya inermi onu görmek lazım öncelikle
   //println("evet böyle bir durum gerçekleşiyor");
  
    yaziAlani.x=(0-imlecOncesi)+2;
     imlec.x=2;
  }
  else if(imlec.x>imlec.w){
    if(yazi.length()>imlecKonum)
    yaziAlani.x=(0-imlecOncesi)+imlec.w;
    imlec.x=imlec.w;
  }
}// fonksiyon sonu

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

boolean anaKarekterGirisiKontrolBasili(){
 return aktiflik;
}// fonksiyon sonu
boolean ozelKarekterGirisiKontrol(){
 return aktiflik;
}// fonksiyon sonu

boolean silmeTusuGirisiKontrol(){
 return aktiflik;
}// fonksiyon sonu
void imlecOlustur(){
  // imlec öncelikle strokenin 1 biriminde dolayı 1 birim kısaltıldı. Sonrada 1 birim boşluk oluşturmak için
  // bir birim kısaltıldı böylelikle toplamda 2 birim kısaltama yapılmış oldu.
  imlec = new dikdortgen(2,2,yaziAlani.w+2,alanim.h-2);
}//

 void anaKarekterFonksiyonuBasili(int tus,int no){ 
   if(no==4){
    if(tus==int(char('v'))||tus==int(char('V'))){
      println("yapıştırma kodu başarılı");
   }// iç if sonu
 
 }// dış if sonu
 }// fonksiyon sonu

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

void mouseTiklamaFonksiyonu(int x,int y){ 
//println("x : " +x+ "y : "+y);
//println("kutuya göre x : " +(x-alanim.x)+ " kutuya göre y : "+(y-alanim.y));
//char b= yazi.charAt(imlecKonum);
//println(b);
float xDegeri=x-alanim.x;
//gelen y değerinin bir anlamı yok biz yinede bu değeri tutmak istiyoruz.
float uDegeri=y-alanim.y;
// bu yapı ileri ve geri yapılarını dinamik kullanmak için oluşturulan bir sorgudur.
boolean calismaDurumu=true;
// akis değişkeni sağamı yoksa sola doğru mu ilerleyeceğimizi ifade eder.
boolean akis=false;
 if(xDegeri>=imlec.x){
  //println("ilk yapılandırmalar geçerli");
 akis=true;
}// if sonu

else{
//  println("ikinci yapılandırmalar geçerli");
 akis=false;
}// else sonu

// imlec hareketi yoksa bizi hiç yorma demek istiyoruz.
//println("imlec konum : "+imlecKonum);
if(yazi.length()>0){
 float geciciToplam=0.0;
 float sonUzunluk=0.0;
 float fark;
 float ilkfark;
 int ekleme=0;
 int geciciImlec=imlecKonum;
 if(akis){
   ilkfark=fark=xDegeri-imlec.x;
  ekleme=1;
 }
 else{
  ilkfark=fark=imlec.x-xDegeri;
  ekleme=-1;
 }
 // imlec sonda ve sağa doğru ilerleme isteniyorsa hareket mekanizmasını engelliyoruz.
   if(imlecKonum+1==yazi.length() && akis==true)
   calismaDurumu=false;
   
// imlec ilk konumunda ise yine hareketsizlik sağlanmalı
   if(imlecKonum<=-1 && akis==false)
   calismaDurumu=false;
   
 //println("ilk fark : "+ilkfark+ " toplam uzunluk : "+geciciToplam + " çalışma durumu : "+ calismaDurumu+ " imleckonum : "+ imlecKonum + " akis : "+ akis);
while(calismaDurumu){
  
   if(fark>=0){  
     if(akis){
  geciciImlec+=ekleme;
  sonUzunluk=yazia[yazi.charAt(geciciImlec)];    
     }// akis if sonu
  
     else{
  sonUzunluk=yazia[yazi.charAt(geciciImlec)];
  geciciImlec+=ekleme;   
     }// akış elsesi sonu
     
  //düşük farkta imlecimizi tamamen öne çektik o yüzden toplam farkta bişey olmadı
  // ama eğer küçük değilse birebir toplam son uzunluk kadar olmalı ayrıca birşey
  // bu ife düştüyse sonlandırılmasıda gerekiyor demektir
  if((sonUzunluk/2)>=fark){
    geciciImlec-=ekleme;
    calismaDurumu=false;
  }
  else{
     geciciToplam+=sonUzunluk;
  }
  // fark her türlü ilerlemeye devam etmek zorunda
  fark-=sonUzunluk;
   }// if sonu
   else{
    calismaDurumu=false; 
   }
   if(geciciImlec==-1 || (geciciImlec+1)==yazi.length()){
    // evet oto denetleme işlemi yapıyoruz şuan eğer bir aşağı iniş varsa calışma durumunun sonlandırılması gerekir
    calismaDurumu=false;
   }
//    println("geciciImcec : "+geciciImlec+" sonUzunluk : "+ sonUzunluk+" toplam Uzunluk : "+ geciciToplam + " fark : "+fark);
}// while sonu
imlecKonum=geciciImlec;
 //tekrardan sağ veya sola göre bir çalıştırma mekanizması oluşturuluyor
 if(akis){
imlecSonrasi-=geciciToplam;
  imlecOncesi+=geciciToplam;
 }
 else{
imlecSonrasi+=geciciToplam;
  imlecOncesi-=geciciToplam;
 }
  imlec.x=imlecOncesi+yaziAlani.x;
  imlecDuzenKontrol();
}//if sonu

}// fonksiyon sonu


}// sınıf sonu
