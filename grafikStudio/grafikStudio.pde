
// öncelik sıralarım ve algoritmik kurgularım bilindik yapılardan çok farklı diye
//kendi yolu çizmekten niye geri kalayım ki

//şuan öncelikle yazı noktasını belirleyecek yapıyı çizmeliyiz.

// ana yapı olarak hızlı bir yazılım dili oluşturma ekipman sistemini oluşturmaya
// çalışmalıyız onun için teknik algoritmalar geliştirmeliyim.
//final olarak tanımlıyoruz ki her yerden kolayca ulaşabilelim
static pencereKontrolu pKontrol;

int r=5;
void setup(){

pKontrol=new pencereKontrolu();
  size(1280,700); 
 // karekterhesap(2);
frameRate(60);
}// ana yapının sonu

void draw(){
 // background(128);
  
  /*
stroke(153);
textSize(11);

textAlign(LEFT, TOP);

text("CENTER,TOP çşiğü ÇŞİĞÜ", 0, 0);
 text("a  a",120,120);
 
 */
 
 pKontrol.draw();
rect(0,0,640,360);
 }// çizim yapısının sonu



void keyPressed(){
  pKontrol.keyPressed(key);
//  println("super ide kısmında başarılı bir çalışma");
}// fonksiyon sonu

void keyReleased(){
  
  pKontrol.keyReleased(key);
}// fonksiyon sonu

void mousePressed(){
 pKontrol.mousePressed(mouseX,mouseY);
}

void mouseMoved(){
 // mousenin yerdeğiştirmesi yada bir şeylerin üzerine gelmesi durumunda olması gereken yapılar incelendiği kısım
// println(" mouse hareket etti ve değerler x konum : "+mouseX+ " y konum : "+ mouseY);
 pKontrol.mouseMoved(mouseX,mouseY);
}
