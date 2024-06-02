<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\AdminController;




Route::get('/', [DashboardController::class, 'index']);

Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
Route::get('/product/{id}', [ProductController::class, 'product'])->name('product');
Route::get('/category/{id}', [ProductController::class, 'category'])->name('category');
Route::get('/order/buy/{id}', [OrderController::class, 'buy'])->name('buy');
Route::get('/order/current', [OrderController::class, 'current'])->name('order.current');
Route::get('/order/process', [OrderController::class, 'process'])->name('order.process');




Route::group(['prefix' => 'admin', 'middleware' => [\App\Http\Middleware\AdminMiddleware::class]], function () {
    Route::get('/categories', [AdminController::class, 'categories'])->name('categories');
    Route::get('/categoryRemove/{id}', [AdminController::class, 'categoryRemove'])->name('category.remove');
    Route::post('/categoryAdd', [AdminController::class, 'categoryAdd'])->name('category.add');
    Route::post('/categoryEdit/{id}', [AdminController::class, 'categoryEdit'])->name('category.edit');
    Route::get('products', [AdminController::class, 'products'])->name('products');
    Route::get('productRemove/{id}', [AdminController::class, 'productRemove'])->name('product.remove');
    Route::post('productAdd', [AdminController::class, 'productAdd'])->name('product.add');
    Route::post('productEdit/{id}', [AdminController::class, 'productEdit'])->name('product.edit');
    Route::get('/orders', [AdminController::class, 'orders'])->name('orders');
 });


require __DIR__.'/auth.php';
