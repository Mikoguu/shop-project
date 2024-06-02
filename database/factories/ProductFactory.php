<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Product;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class ProductFactory extends Factory
{

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->realText($maxNbChars = 10, $indexSize = 2),
            'description' => fake()->text(),
            'category_id' => mt_rand(1, 5),
            'price' => 10 * round(0.1 * mt_rand(100, 10000)),
            'image' => ''
        ];
    }
}
