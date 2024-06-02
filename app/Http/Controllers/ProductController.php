<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

    public function product(int $id)
    {
        $product = Product::query()->with('category')->find($id);
        return view('product', ['product' => $product]);
    }

    public function category(int $id)
    {
        $products = Product::query()->where('category_id', '=', $id)->paginate(6);
        return view('dashboard', [
            'products' => $products,
            'categories' => Category::all(),
            'currentCategory' => Category::find($id)
        ]);
    }
}