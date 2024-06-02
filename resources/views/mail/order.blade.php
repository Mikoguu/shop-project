
Пользователь {{ $user->id }} совершил заказ следующих позиций товаров: <br>

<br>
@forelse($order->products as $product)
    {{ $product->id }} {{ $product->name }}
@empty
    Нет товаров в заказе
@endforelse