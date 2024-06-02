<?php

namespace App\Providers;

use App\Models\Order;
use App\Models\Category;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Auth;
use Illuminate\Pagination\Paginator;



class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::useBootstrapFour();

        $productsAmount = 0;

        View::composer('layouts.sidebar.categories', function (\Illuminate\View\View $view) {
            return $view
                ->with('categories', Category::all());
        });

        View::composer('*', function (\Illuminate\View\View $view) use ($productsAmount) {
            $id = Auth::id();
            if ($id) {
                $currentOrder = Order::getCurrentOrder($id);

                if ($currentOrder) {
                    $productsAmount = sizeof($currentOrder->products);
                }
            }

            return $view
                ->with('productsAmount', $productsAmount);
        });

    }
}
