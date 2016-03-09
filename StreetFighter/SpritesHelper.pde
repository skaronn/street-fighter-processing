import javax.swing.*; 

class SpritesHelper {
  float coeff = .5;
  int spriteW, spriteH;
  SecondApplet s;
  PImage sprite;
  PFrame f;

  SpritesHelper(PImage img) {
    sprite = img;
    spriteW = int(coeff*img.width);
    spriteH = int(coeff*img.height);
    f = new PFrame(spriteW, spriteH);
    f.setTitle("second window");
  }

  void displayRect(int x, int y, int w, int h) {
    s.displayRect(int(coeff*x), int(coeff*y), int(coeff*w), int(coeff*h));
  }

  public class PFrame extends JFrame {
    public PFrame(int width, int height) {
      setBounds(100, 100, width, height);
      s = new SecondApplet();
      add(s);
      s.init();
      show();
    }
  }
  public class SecondApplet extends PApplet {
    int x, y, w, h;
    public void setup() {
      stroke(230, 12, 12);
      strokeWeight(2);
      noFill();
    }

    public void draw() {
      background(60);
      image(sprite, 0, 0, spriteW, spriteH);
      rect(x, y, w, h);
    }

    void displayRect(int x, int y, int w, int h) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
    }
  }
}

