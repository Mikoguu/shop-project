<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Mail\OrderCompleted;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;

class OrderController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

     public function __construct()
    {
        $this->middleware('auth');
    }

     public function buy(int $id)
     {
         $product = Product::query()->find($id);
 
         if (!$product) {
             return redirect()->route('home');
         }
 
         $currentOrder = Order::getCurrentOrder(Auth::id());
 
         if (!$currentOrder) {
             ($currentOrder = new Order([
                 'user_id' => Auth::id(),
                 'state' => Order::STATE_CURRENT
             ]))->save();
         }
 
         (new OrderProduct(['order_id' => $currentOrder->id, 'product_id' => $id]))->save();

 
         return redirect()->route('order.current');
     }

    public function current()
    {
        $order = Order::getCurrentOrder(Auth::id());

        return view('order.current', [
            'products' => $order->products ?? [],
            'sum' => $order ? $order->getSum() : 0
        ]);
    }

    public function process()
    {
        $currentOrder = Order::getCurrentOrder(Auth::id());

        if (!$currentOrder) {
            return redirect()->route('dashboard');
        }

        Mail::to(User::query()->find(2))->send(new OrderCompleted($currentOrder, Auth::user()));

        $currentOrder->saveAsProcessed();

        return view('order.completed');

    }
}
