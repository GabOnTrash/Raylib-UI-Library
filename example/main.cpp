#include "include/Menù.h"

int main()
{
    const int WINDOW_WIDTH = 1000, 
        WINDOW_HEIGHT = 1000;

    InitWindow(WINDOW_WIDTH, WINDOW_WIDTH, "Example");

    Menu Interface;

    float value = 0;

    int min = 0, 
        max = 100;


    RectS rect(50, 100, 20, 100, 0, 0, min, max, &value, ORANGE);
    PointerS pointer(true, 25, 25, 0, 0, RED);

    Interface.add<Label>("label", "Interface Example", nullptr, GetFontDefault(), 80, WINDOW_WIDTH / 2 + WINDOW_WIDTH / 100, 100, RAYWHITE, WHITE);
    Interface.add<Button>("clickMe", "Click Me!", GetFontDefault(), 50, 200, 120, WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2, nullptr, 0.3f, 10, 5, BLANK, WHITE, DARKGRAY, DARKGRAY);
    Interface.add<Slider>("slider", rect, pointer);

    while (!WindowShouldClose())
    {
        BeginDrawing();

        ClearBackground(LIGHTGRAY);

        Interface.update();
        Interface.draw();

        if (*(Interface.getByID("slider")->getRect().getVar()) >= 50)
        {
            Interface.deactive("clickMe");
        }
        else 
        {
            Interface.activate("clickMe");
        }

        EndDrawing();
    }
    CloseWindow();
}