// burda bazı argümanlar için lazım olacak çağrıları yapıyoruz

//kopyala yapıştır sistemi için lazım olan ekipmanlar.
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.awt.*;
import java.awt.event.*;
import java.awt.datatransfer.*;
import javax.swing.*;
import java.io.*;


class dikdortgen{
  float x,y;
  float w,h;
  
  dikdortgen(float x, float y, float w, float h){
    this.x=x; this.y=y; this.w=w; this.h=h;
  }// constructor sonu
  
}// sınıf sonu

class kopyalaYapistir{
  
  kopyalaYapistir(){
    
    
  }
  String yapistir () {
  String text = (String) GetFromClipboard(DataFlavor.stringFlavor);
 
  if (text==null) 
    return "";
 
  return text;
}

void kopyala(String text){
  StringSelection data = new StringSelection(text);
Clipboard clipboard = 
 Toolkit.getDefaultToolkit().getSystemClipboard();
 clipboard.setContents(data, data);
}
 
Object GetFromClipboard (DataFlavor flavor) {
 
  Clipboard clipboard = getJFrame(getSurface()).getToolkit().getSystemClipboard();
 
  Transferable contents = clipboard.getContents(null);
  Object object = null; // the potential result 
 
  if (contents != null && contents.isDataFlavorSupported(flavor)) {
    try
    {
      object = contents.getTransferData(flavor);
      println ("Clipboard.GetFromClipboard() >> Object transferred from clipboard.");
    }
 
    catch (UnsupportedFlavorException e1) // Unlikely but we must catch it
    {
      println("Clipboard.GetFromClipboard() >> Unsupported flavor: " + e1);
      e1.printStackTrace();
    }
 
    catch (java.io.IOException e2)
    {
      println("Clipboard.GetFromClipboard() >> Unavailable data: " + e2);
      e2.printStackTrace() ;
    }
  }
 
  return object;
} 
  
}
static final javax.swing.JFrame getJFrame(final PSurface surf) {
  return
    (javax.swing.JFrame)
    ((processing.awt.PSurfaceAWT.SmoothCanvas)
    surf.getNative()).getFrame();
}
