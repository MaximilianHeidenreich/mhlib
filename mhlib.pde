

void setup() {
    size(400, 400);
    _setupCore();
}

void draw() {
    background(#fefefe);
    float w = sin(radians(10 + frameCount)) * 200;
    fill(#ff0033);
    circle(200 + w, w, 50 + w/2);
    rec(30, 360);
    thumb(40);
}