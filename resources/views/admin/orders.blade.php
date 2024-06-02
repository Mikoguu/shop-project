@extends('layouts.app')

@section('content')
    <div class="content-middle">
        <h3>История заказов</h3>
        @foreach($orders as $order)
        <li>
            <span><b>Id пользователя:</b> {{ $order->user_id }}</span>
            <span><b>Состояние заказа (1 - заказ в корзине, 2 - заказ совершен):</b> {{ $order->state }}</span>
            <span><b>Дата заказа:</b> {{ $order->created_at }}</span>
        </li>
        @endforeach
</div>
@endsection