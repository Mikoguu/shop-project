<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Categories;
use App\Models\Product;
use App\Models\Products;
use App\Models\Order;
use Illuminate\Support\Facades\DB;

class AdminController extends Controller
{
    public function categories()
    {
        return view('admin.categories',[
            'categories' => Category::query()->get()
        ]);
    }

    public function categoryRemove($id)
    {
         Category::query()->find($id)->delete();
         
         return redirect('/admin/categories');
    }

    public function categoryAdd()
    {
        $name = (string) $_POST['name'];
        $description = (string) $_POST['description'];

        (new Categories([
            'name' => $name,
            'description' => $description
        ]))->save();

        return redirect('/admin/categories');
    }

    public function categoryEdit(Request $request, $id)
    {

        $item = Category::find($id);
        $item->name = $request->input('name');
        $item->description = $request->input('description');
    
        $item->save();

        return redirect('/admin/categories');
    }

    public function products()
    {
        {
            return view('admin.products',[
                'products' => Product::query()->get()
            ]);
        }
    }

    public function productRemove($id)
    {
         Product::query()->find($id)->delete();
         
         return redirect('/admin/products');
    }

    public function productAdd()
    {
        $name = (string) $_POST['name'];
        $description = (string) $_POST['description'];
        $price = (int) $_POST['price'];
        $categoryId = (int) $_POST['category_id'];

        (new Products([
            'name' => $name,
            'description' => $description,
            'price' => $price,
            'category_id' => $categoryId
        ]))->save();

        return redirect('/admin/products');
    }

    public function productEdit(Request $request, $id)
    {

        $item = Product::find($id);
        $item->name = $request->input('name');
        $item->description = $request->input('description');
        $item->price = $request->input('price');
        $item->category_id= $request->input('category_id');
    
        $item->save();

        return redirect('/admin/products');
    }

    public function orders()
    {
        $orders = DB::table('orders')
        ->join('order_products', 'orders.user_id', '=', 'order_products.order_id')
        ->select('orders.*', 'order_products.product_id')
        ->get();

        return view('admin.orders',[
            'orders' => $orders
        ]);
    }
}
