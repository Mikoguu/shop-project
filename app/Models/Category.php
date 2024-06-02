<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Category
 * @package App
 *
 * @property-read $id
 * @property-read $title
 * @property-read $description
 * @property-read Product[] $products
 */
class Category extends Model
{
    
    public function products()
    {
        return $this->hasMany(Product::class);
    }
}