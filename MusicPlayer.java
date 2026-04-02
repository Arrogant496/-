import javax.sound.sampled.*;
import java.io.File;
import java.io.IOException;

public class MusicPlayer {
    private Clip clip; // 用于播放音乐的 Clip 对象
    private boolean isPlaying = false; // 记录音乐是否正在播放

    // 加载音乐文件
    public void loadMusic(String filePath) {
        try {
            // 如果已经有音乐在播放，先停止并释放资源
            if (clip != null) {
                clip.stop();
                clip.close();
            }
            File musicFile = new File(filePath);
            AudioInputStream audioInput = AudioSystem.getAudioInputStream(musicFile);
            clip = AudioSystem.getClip();
            clip.open(audioInput);
        } catch (UnsupportedAudioFileException | IOException | LineUnavailableException e) {
            e.printStackTrace();
        }
    }

    // 播放音乐（循环播放）
    public void play() {
        if (clip != null && !isPlaying) {
            clip.start();
            clip.loop(Clip.LOOP_CONTINUOUSLY); // 循环播放
            isPlaying = true;
        }
    }

    // 暂停音乐
    public void pause() {
        if (clip != null && isPlaying) {
            clip.stop();
            isPlaying = false;
        }
    }

    // 停止音乐
    public void stop() {
        if (clip != null) {
            clip.stop();
            clip.close();
            isPlaying = false;
        }
    }
}