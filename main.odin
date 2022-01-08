package main

import "core:math/rand"
import rl "vendor:raylib"

main :: proc(){
	rl.InitWindow(1200, 800, "Bubble Sort")

	screen_width := rl.GetScreenWidth()
	screen_height := rl.GetScreenHeight()

	random_number := rand.float32_range(0,100)
	values : [dynamic]i32

	n: int = 0
	length: int = 0

	for i:=0; i<int(screen_width); i += 1{
		append(&values, rand.int31_max(screen_height) + 1)
	}

	length = len(values) - 1

	rl.SetTargetFPS(20)

	for !rl.WindowShouldClose(){

		if n <= length - 1 {
			for j:=0; j<=length - n - 1; j+=1{
				temp := values[j + 1]
				a:=values[j]
				b:=values[j+1]

				if a > b {
					values[j+1] = values[j]
					values[j] = temp
				}
			}
			n += 1
		}

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		iter: i32 = 0

		for i in &values{
			rl.DrawLine(iter, screen_height, iter, screen_height - i, rl.RED)
			iter += 1
		}
		
		rl.EndDrawing()
	}

	rl.CloseWindow()
}