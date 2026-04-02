import java.awt.*;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.ImageObserver;

public class Bg {
    //关卡数
    static  int level=1;
    //目标得分
    int goal=level*15;
    //总分
    static int count=0;
    //药水数量
    static int waterNum=3;
    //药水状态 T--正在使用
    static boolean waterFlag=false;
    //开始时间
    long startTime;
    //结束时间
    long endTime;
    //药水价格
    int price= (int) (Math.random()*10);
    //是否进入商店f不购买
    boolean shop=false;
    // 背景音乐播放器
    private MusicPlayer musicPlayer;
    //欢呼声音乐播放器
    private MusicPlayer clap;
    //载入图片
    Image bg = Toolkit.getDefaultToolkit().getImage("imgs/bg.jpg");
    Image bg1 = Toolkit.getDefaultToolkit().getImage("imgs/bg1.jpg");
    Image peo = Toolkit.getDefaultToolkit().getImage("imgs/peo.png");
    Image water=Toolkit.getDefaultToolkit().getImage("imgs/water.png");
    public Bg() {
        // 初始化音乐播放器并加载背景音乐
        musicPlayer = new MusicPlayer();
        musicPlayer.loadMusic("imgs/bgm.wav");
        musicPlayer.play(); // 游戏开始时播放音乐
        clap=new MusicPlayer();
        clap.loadMusic("imgs/clap.wav");
    }
    //绘制
    void paintSelf(Graphics g) {
        g.drawImage(this.bg1, 0, 0, (ImageObserver)null);
        g.drawImage(this.bg, 0, 200, (ImageObserver)null);
        switch (GameWin.state){
            case 0:
                drawWord(g,80,Color.yellow,"准备开始",200,400);
                break;
            case 1:
                musicPlayer.play();
                g.drawImage(this.peo, 310, 50, (ImageObserver)null);
                drawWord(g,30,Color.black,"积分:"+count,30,150);
                //药水组件
                g.drawImage(water,450,40,null);
                drawWord(g,30,Color.black,"*"+waterNum,510,70);
                //关卡数
                drawWord(g,20,Color.black,"第"+level+"关",30,60);
                //目标积分
                drawWord(g,30,Color.black,"目标:"+goal,30,110);
                //时间组件
                endTime=System.currentTimeMillis();
                long tim=30-(endTime-startTime)/1000;
                drawWord(g,30,Color.black,"时间:"+(tim>0?tim:0),520,150);
                break;
            case 2:
                g.drawImage(water,300,400,null);
                drawWord(g,30,Color.black,"价格:"+price,300,500);
                drawWord(g,30,Color.black,"是否购买?",300,550);
                if(shop){
                    count=count-price;
                    waterNum++;
                    shop=false;
                    GameWin.state=1;
                    startTime=System.currentTimeMillis();
                }
                break;
            case 3:
                musicPlayer.pause();
                drawWord(g,80,Color.red,"失败",250,350);
                drawWord(g,80,Color.gray,"积分:"+count,200,450);
                break;
            case 4:
                clap.play();
                drawWord(g,80,Color.green,"成功",250,350);
                drawWord(g,80,Color.black,"积分:"+count,200,450);
                break;
            default:
                break;
        }

        }
        //t--倒计时完成 f--正在倒计时
        boolean gameTime(){
            long tim=(endTime-startTime)/1000;
            if(tim>30){
                return true;
            }
            return false;
    }
    //重置元素
    void reGame(){
        musicPlayer.stop(); // 停止当前音乐
        musicPlayer.loadMusic("imgs/bgm.wav");
        musicPlayer.play(); // 重新播放音乐
        //关卡数
         level=1;
        //目标得分
         goal=level*15;
        //总分
         count=0;
        //药水数量
        waterNum=3;
        //药水状态 T--正在使用
        waterFlag=false;
    }

    //绘制字符串
    public static  void  drawWord(Graphics g,int size,Color color,String str,int x,int y){
        g.setColor(color);
        g.setFont(new Font("仿宋",Font.BOLD,size));
        g.drawString(str,x,y);
    }
}