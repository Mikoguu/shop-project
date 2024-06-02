<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class Order extends Model
{

    const STATE_CURRENT = 1;
    const STATE_PROCESSED = 2;

    protected $fillable = ['user_id', 'state'];

    private static $currentOrder = false;

    
    public function products()
    {
        return $this->belongsToMany(
            Product::class,
            'order_products',
            'order_id',
            'product_id'
        );
    }

    public function getSum(): int
    {
        $sum = 0;
        /** @var Product $product */
        foreach ($this->products as $product) {
            $sum += $product->price;
        }

        return (int) $sum;
    }

    public static function getCurrentOrder(int $id)
    {
        if (self::$currentOrder === false) {
            self::$currentOrder = self::query()
                ->where('user_id', '=', $id)
                ->where('state', '=', Order::STATE_CURRENT)
                ->first();
        }
        return self::$currentOrder;
    }

    public function saveAsProcessed()
    {
        $this->state = self::STATE_PROCESSED;
        return $this->save();
    }

    public function getAllOrders()
    {
       $table = DB::table('orders')
        ->select('orders.user_id','orders.state', 'order_products.product_id')
        ->join('order_products','order_procuts.order_id','=','orders.user_id')
        ->get();

        return $table;
    }

}