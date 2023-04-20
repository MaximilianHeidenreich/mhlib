// mh-core v1.0

import com.hamoid.*;

// CONSTS
final String SKETCH_NAME = getClass().getName();
String RENDER_DIR = "out/";
VideoExport VIDEO_EXPORT;


// ======================== CORE SETUP

void _setupCore() {
    // Create render dir
    createOutput(RENDER_DIR + "state.json");
}



// ======================== UTILS

String timestamp() {
    return String.valueOf(year()) + "-" +
        String.valueOf(month()) + "-" +
        String.valueOf(day()) + "-" +
        String.valueOf(hour()) + ":" +
        String.valueOf(minute()) + ":" +
        String.valueOf(second()) + "-" +
        String.valueOf(millis());
}

// ======================== VIDEO RECORDING & THUMBNAILS

/**
  * Records a video of the sketch.
  * @param frameRate the frame rate of the video
  * @param forNFrames the number of frames to record
  */
void rec(int frameRate, int forNFrames) {
    println("[REC] " + frameCount + "/" + forNFrames + " @ " + frameRate + "fps");
    if (frameCount == 1) {
        final String name = RENDER_DIR + SKETCH_NAME + "_" + timestamp() + ".mp4";
        VIDEO_EXPORT = new VideoExport(this, name);
        VIDEO_EXPORT.setFrameRate(frameRate);
        VIDEO_EXPORT.startMovie();
    }
    VIDEO_EXPORT.saveFrame();
    if (frameCount == forNFrames) {
        println("[REC] done | " + ( forNFrames / frameRate ) + "sec");
        VIDEO_EXPORT.endMovie();
        exit();
    }
}

/**
  * Saves a thumbnail of the sketch in the sketch folder and in the parent folder.
  * @param frame the frame number at which the thumbnail should be saved
  */
void thumb(int frame) {
    if (frameCount != frame) return;
    final String name = SKETCH_NAME + "-thumb.png";
    saveFrame("../" + name);
    saveFrame("./"  + name);
}


// ======================== STATE MANAGEMENT
void saveState() {}
void loadState() {}


